#
#  views.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co
from loguru import logger
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView

from api.views.patient.serializers.model import PatientModelSerializer
from services.helpers.api_response import ApiResponse
from services.permissions.is_patient import IsPatient


class PatientDetailsView(APIView):
    permission_classes = (
        IsAuthenticated,
        IsPatient,
    )

    def get(self, request):
        try:
            return ApiResponse(
                data={"details": PatientModelSerializer(request.user.patient).data}
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)
