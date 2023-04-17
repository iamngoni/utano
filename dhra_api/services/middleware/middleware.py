#
#  middleware.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

import json

from django.core.serializers.json import DjangoJSONEncoder
from django.http import HttpRequest, HttpResponse
from django.utils.deprecation import MiddlewareMixin
from loguru import logger

from system.models import ApiRequest


class RequestLoggerMiddleware(MiddlewareMixin):
    def __init__(self, get_response):
        super().__init__(get_response)

    def process_request(self, request):
        try:
            # save request

            is_admin = request.path.split("/admin/")
            if len(is_admin) > 1:
                logger.warning("Admin dashboard request -> skipping")
            else:
                headers = dict(request.headers)

                del headers["Authorization"]
                del headers["Cookie"]

                req = ApiRequest(
                    method=request.method,
                    headers=str(headers),
                    path=request.path,
                )
                req.save()

                request.id = req.id
        except Exception as exc:
            logger.warning(
                f"{type(exc)}: Failed to log request, probably websocket request"
            )
            pass

    def process_response(
        self, request: HttpRequest, response: HttpResponse
    ) -> HttpResponse:
        try:
            response_content = json.loads(response.content)
            response_content["request_id"] = request.id
            response.content = json.dumps(response_content, cls=DjangoJSONEncoder)
        except Exception:
            logger.warning("Response is not JSON parseable, probably HTML.")
        return response
