from rest_framework.views import APIView

from api.views.health_institution.serializers.model import (
    HealthInstitutionModelSerializer,
)
from health_institution.models import HealthInstitution, Client
from services.helpers.api_response import api_response
from services.permissions.is_admin import IsAdmin


class HealthInstituteDetailsView(APIView):
    def get(self, request):
        client_id = request.headers.get("Client-Id")
        client = Client.get_item_by_id(client_id)
        if client is None:
            return api_response(
                request,
                num_status=404,
                bool_status=False,
                message="Institution details not saved yet",
            )

        health_institution = client.health_institution

        return api_response(
            request,
            data={
                "health_institution": HealthInstitutionModelSerializer(
                    health_institution
                ).data,
            },
        )
