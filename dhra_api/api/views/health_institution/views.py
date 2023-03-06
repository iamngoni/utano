from loguru import logger
from rest_framework.views import APIView

from api.views.health_institution.serializers.model import (
    HealthInstitutionModelSerializer,
    EmployeeModelSerializer,
)
from health_institution.models import HealthInstitution
from services.helpers.api_response import ApiResponse
from services.permissions.is_admin import IsAdmin
from users.models import UserRoles


class HealthInstitutionDetailsView(APIView):
    permission_classes = [IsAdmin]

    def get(self, request):
        try:
            health_institution = request.user.employee.registered_at
            return ApiResponse(
                data={
                    "health_institution": HealthInstitutionModelSerializer(
                        health_institution
                    ).data
                }
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class HealthInstitutionEmployeesView(APIView):
    permission_classes = [IsAdmin]

    def get(self, request):
        try:
            health_institution = request.user.employee.registered_at
            # check if request has a role query params
            role = request.query_params.get("role")
            if role:
                if role not in UserRoles.get_list_of_options():
                    return ApiResponse(
                        num_status=400,
                        bool_status=False,
                        message="Invalid role",
                    )
                if role != UserRoles.PATIENT:
                    employees = health_institution.employees.filter(user__role=role)
                else:
                    return ApiResponse(
                        num_status=400,
                        bool_status=False,
                        message="Invalid role",
                    )
            else:
                employees = health_institution.employees.all()
            return ApiResponse(
                data={"employees": EmployeeModelSerializer(employees, many=True).data}
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)
