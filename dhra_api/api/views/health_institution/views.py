from django.db import transaction
from loguru import logger
from rest_framework.views import APIView

from api.views.health_institution.serializers.model import (
    HealthInstitutionModelSerializer,
    EmployeeModelSerializer,
)
from api.views.health_institution.serializers.payload import (
    HealthInstitutionEmployeesPayloadSerializer,
)
from health_institution.models import HealthInstitution
from services.helpers.api_response import ApiResponse
from services.helpers.generate_random_password import generate_random_password
from services.permissions.is_admin import IsAdmin
from users.models import UserRoles, User, Employee
from api.views.health_institution.tasks import notify_employee_on_registration


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
    serializer_class = HealthInstitutionEmployeesPayloadSerializer

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

    @transaction.atomic()
    def post(self, request):
        try:
            payload = self.serializer_class(data=request.data)
            if payload.is_valid():
                user = User(
                    first_name=payload.validated_data.get("first_name"),
                    last_name=payload.validated_data.get("last_name"),
                    role=payload.validated_data.get("role"),
                    email=payload.validated_data.get("email"),
                    gender=payload.validated_data.get("gender"),
                )
                password = generate_random_password()
                user.set_password(password)
                user.save()

                employee = Employee(
                    user=user, registered_at=request.user.employee.registered_at
                )
                employee.save()

                notify_employee_on_registration.delay(user, password)
                return ApiResponse()
            else:
                logger.error(payload.errors)
                return ApiResponse(
                    num_status=400, bool_status=False, issues=payload.errors
                )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)
