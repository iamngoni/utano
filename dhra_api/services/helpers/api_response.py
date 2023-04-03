import json

from django.core.serializers.json import DjangoJSONEncoder
from django.http import HttpResponse
from loguru import logger
from rest_framework.utils.serializer_helpers import ReturnDict


class ApiResponse(HttpResponse):
    def __init__(
        self,
        num_status: int = 200,
        bool_status: bool = True,
        data=None,
        issues=None,
        message: str = None,
    ):

        if message is None:
            message = self.status_meaning(num_status).get("meaning")

            if num_status == 400:
                # return only the first serializer error as the response
                # message
                if issues is not None:
                    logger.info(type(issues))
                    if type(issues) is ReturnDict:
                        message = issues.get(list(issues.keys())[0])[0]

        response = {
            # "request_id": req.id,
            "status": bool_status,
            "status_description": self.status_meaning(num_status).get("description"),
            "message": message,
            "data": data,
            "issues": issues,
            "version": 1.0,
            "versioned_by": "ModestNerds, Co",
        }

        response_data = json.dumps(response, cls=DjangoJSONEncoder, **{})
        super().__init__(
            content=response_data, content_type="application/json", status=num_status
        )

    def status_meaning(self, status: int) -> dict:
        meaning = {
            200: {"meaning": "OK", "description": "Request was executed successfully"},
            201: {
                "meaning": "Created",
                "description": "Resource was created successfully",
            },
            202: {
                "meaning": "Accepted",
                "description": "Request was accepted, but not yet executed",
            },
            204: {"meaning": "No Content", "description": "No content was returned"},
            301: {
                "meaning": "Moved Permanently",
                "description": "Resource was moved permanently",
            },
            303: {
                "meaning": "See Other",
                "description": "Resource was moved temporarily",
            },
            304: {
                "meaning": "Not Modified",
                "description": "Resource was not modified",
            },
            307: {
                "meaning": "Temporary Redirect",
                "description": "Resource was moved temporarily",
            },
            400: {"meaning": "Bad Request", "description": "Request was malformed"},
            401: {
                "meaning": "Unauthorized",
                "description": "Request was not authorized",
            },
            402: {"meaning": "Forbidden", "description": "Request was forbidden"},
            403: {"meaning": "Forbidden", "description": "Request was forbidden"},
            404: {"meaning": "Not Found", "description": "Resource was not found"},
            405: {
                "meaning": "Method Not Allowed",
                "description": "Method was not allowed",
            },
            406: {
                "meaning": "Not Acceptable",
                "description": "Request was not acceptable",
            },
            409: {
                "meaning": "Conflict",
                "description": "Request was not executed due to conflict",
            },
            412: {
                "meaning": "Precondition Failed",
                "description": "Request was not executed due to precondition",
            },
            415: {
                "meaning": "Unsupported Media Type",
                "description": "Request was not executed due to unsupported media type",
            },
            500: {
                "meaning": "Server Error",
                "description": "Server was unable to execute request",
            },
        }

        return meaning.get(status, None)
