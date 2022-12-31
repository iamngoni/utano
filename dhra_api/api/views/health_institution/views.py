from rest_framework.views import APIView

from health_institution.models import HealthInstitution
from services.permissions.is_admin import IsAdmin


class HealthInstituteDetailsView(APIView):
    permission_classes = (IsAdmin,)

    def get(self, request):
        health_institution = HealthInstitution.objects.first()
        return api_response()

    def post(self, request):
        pass

    def put(self, request):
        pass
