#
#  views.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from loguru import logger
from rest_framework.views import APIView

from system.models import Province


class ProvincesView(APIView):
    def get(self, request):
        try:
            provinces = Province.objects.all()
        except Exception as exc:
            logger.error(exc)
            return
