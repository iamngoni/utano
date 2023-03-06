#
#  views.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from loguru import logger
from rest_framework.views import APIView

from api.views.system.serializers.model import ProvinceModelSerializer
from services.helpers.api_response import ApiResponse
from system.models import Province


class ProvincesView(APIView):
    def get(self, request):
        try:
            provinces = Province.objects.all()
            return ApiResponse(
                data={"provinces": ProvinceModelSerializer(provinces, many=True).data}
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)
