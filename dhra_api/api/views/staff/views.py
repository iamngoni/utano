from django.db import transaction
from loguru import logger
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView

from api.views.staff.serializers.model import (
    HealthInstitutionModelSerializer,
    EmployeeModelSerializer,
)
from api.views.staff.serializers.payload import (
    HealthInstitutionDetailsPayloadSerializer,
    HealthInstitutionAdminPayloadSerializer,
)
from health_institution.models import HealthInstitution
from services.helpers.api_response import ApiResponse
from services.helpers.create_username import create_username
from services.helpers.generate_random_password import generate_random_password
from services.permissions.is_staff import IsStaff
from services.permissions.is_system_admin import IsSystemAdmin
from users.models import UserRoles, User, Employee, Patient
from api.views.health_institution.tasks import notify_health_institution_on_registration


class HealthInstitutionsView(APIView):
    permission_classes = (
        IsAuthenticated,
        IsSystemAdmin,
    )
    serializer_class = HealthInstitutionDetailsPayloadSerializer

    def get(self, request):
        try:
            health_institutions = HealthInstitution.objects.all()
            return ApiResponse(
                data={
                    "health_institutions": HealthInstitutionModelSerializer(
                        health_institutions, many=True
                    ).data
                },
            )
        except Exception as exc:
            logger.error(f"exception: {exc}")
            return ApiResponse(num_status=500, bool_status=False)

    @transaction.atomic()
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

                # create admin user for the newly registered health institution
                username = create_username(
                    first_name=health_institution.name,
                    last_name=health_institution.district.name,
                )

                user = User(
                    first_name=health_institution.name,
                    last_name=health_institution.district.name,
                    email=health_institution.email,
                    username=username,
                    role=UserRoles.ADMIN,
                    is_staff=True,
                    is_active=True,
                    is_verified=True,
                )

                password = generate_random_password()
                user.set_password(password)
                user.save()

                # create employee
                employee = Employee(
                    user=user,
                    registered_at=health_institution,
                )
                employee.save()

                notify_health_institution_on_registration.delay(
                    health_institution, password
                )

                return ApiResponse(
                    num_status=201,
                    data={
                        "health_institution": HealthInstitutionModelSerializer(
                            health_institution
                        ).data
                    },
                )
            else:
                logger.error(f"invalid payload: {payload.errors}")
                return ApiResponse(
                    num_status=400, bool_status=False, issues=payload.errors
                )
        except Exception as exc:
            logger.error(f"exception: {exc}")
            return ApiResponse(num_status=500, bool_status=False)


class HealthInstitutionEmployeesView(APIView):
    permission_classes = (IsStaff,)

    def get(self, request, health_institution_id):
        try:
            health_institution = HealthInstitution.get_item_by_id(health_institution_id)
            if health_institution is None:
                logger.error(
                    f"health institution with id: {health_institution_id} does not exist"
                )
                return ApiResponse(num_status=404, bool_status=False)

            employees = health_institution.employees.all()
            return ApiResponse(
                data={"employees": EmployeeModelSerializer(employees, many=True).data},
            )

        except Exception as exc:
            logger.error(f"exception: {exc}")
            return ApiResponse(num_status=500, bool_status=False)

    def post(self, request):
        pass


class HealthInstitutionAdminsView(APIView):
    permission_classes = (IsSystemAdmin,)
    serializer_class = HealthInstitutionAdminPayloadSerializer

    def get(self, request, health_institution_id):
        try:
            health_institution = HealthInstitution.get_item_by_id(health_institution_id)
            if health_institution is None:
                logger.error(
                    f"health institution with id: {health_institution_id} does not exist"
                )
                return ApiResponse(num_status=404, bool_status=False)

            admin_employees = health_institution.employees.filter(
                user__role=UserRoles.ADMIN
            )
            return ApiResponse(
                data={
                    "admins": EmployeeModelSerializer(admin_employees, many=True).data
                },
            )

        except Exception as exc:
            logger.error(f"exception: {exc}")
            return ApiResponse(num_status=500, bool_status=False)

    def post(self, request, health_institution_id):
        try:
            health_institution = HealthInstitution.get_item_by_id(health_institution_id)
            if health_institution is None:
                logger.error(
                    f"health institution with id: {health_institution_id} does not exist"
                )
                return ApiResponse(num_status=404, bool_status=False)

            payload = self.serializer_class(data=request.data)
            if payload.is_valid():
                # generate username
                username = create_username(
                    first_name=payload.validated_data.get("first_name"),
                    last_name=payload.validated_data.get("last_name"),
                )
                # create new user
                user = User(
                    first_name=payload.validated_data.get("first_name"),
                    last_name=payload.validated_data.get("last_name"),
                    gender=payload.validated_data.get("gender"),
                    email=payload.validated_data.get("email"),
                    username=username,
                    role=UserRoles.ADMIN,
                    is_staff=True,
                    is_active=True,
                    is_verified=True,
                )

                # generate and set password
                password = generate_random_password()
                user.set_password(password)
                user.save()

                # create employee
                employee = Employee(
                    user=user,
                    registered_at=health_institution,
                )
                employee.save()
                return ApiResponse(
                    data={
                        "admin": EmployeeModelSerializer(employee).data,
                    },
                )
            else:
                logger.error(f"invalid payload: {payload.errors}")
                return ApiResponse(
                    num_status=400, bool_status=False, issues=payload.errors
                )
        except Exception as exc:
            logger.error(f"exception: {exc}")
            return ApiResponse(num_status=500, bool_status=False)


class SystemStatisticsView(APIView):
    permission_classes = (
        IsAuthenticated,
        IsSystemAdmin,
    )

    def get(self, request):
        try:
            health_institutions = HealthInstitution.objects.count()
            employees = Employee.objects.count()
            patients = Patient.objects.count()

            return ApiResponse(
                data={
                    "health_institutions": health_institutions,
                    "employees": employees,
                    "patients": patients,
                }
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)
