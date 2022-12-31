from rest_framework.views import APIView

from api.views.staff.serializers.model import HealthInstitutionModelSerializer
from api.views.staff.serializers.payload import (
    HealthInstitutionDetailsPayloadSerializer,
)
from loguru import logger

from health_institution.models import HealthInstitution
from services.helpers.api_response import api_response
from services.permissions.is_admin import IsAdmin


class RegisterHealthInstitutionView(APIView):
    permission_classes = (IsAdmin,)
    serializer_class = HealthInstitutionDetailsPayloadSerializer

    def post(self, request):
        try:
            payload = self.serializer_class(data=request.data)
            if payload.is_valid():
                health_institution = HealthInstitution(
                    name=payload.validated_data.get("name"),
                    address=payload.validated_data.get("address"),
                    phone_number=payload.validated_data.get("phone_number"),
                    email=payload.validated_data.get("email"),
                    district=payload.validated_data.get("district"),
                    logo=request.FILES.get("logo"),
                )
                health_institution.save()

                return api_response(
                    request,
                    num_status=201,
                    data={
                        "health_institution": HealthInstitutionModelSerializer(
                            health_institution
                        ).data
                    },
                )
            else:
                logger.error(f"invalid payload: {payload.errors}")
                return api_response(
                    request, num_status=400, bool_status=False, issues=payload.errors
                )
        except Exception as exc:
            logger.error(f"exception: {exc}")
            return api_response(request, num_status=500, bool_status=False)
