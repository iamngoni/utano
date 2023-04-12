import calendar

from django.db import transaction
from django.db.models import Count
from django.db.models.functions import TruncMonth, TruncDay
from django.utils import timezone
from loguru import logger
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView

from api.views.health_institution.serializers.model import (
    HealthInstitutionModelSerializer,
    EmployeeModelSerializer,
)
from api.views.health_institution.serializers.payload import (
    HealthInstitutionEmployeesPayloadSerializer,
)
from api.views.health_institution.tasks import notify_employee_on_registration
from pos.models import PatientCheckIn
from services.helpers.api_response import ApiResponse
from services.helpers.create_username import create_username
from services.helpers.generate_random_password import generate_random_password
from services.permissions.is_admin import IsAdmin
from services.permissions.is_employee import IsEmployee
from system.models import CheckInStatus
from users.models import UserRoles, User, Employee


class HealthInstitutionDetailsView(APIView):
    permission_classes = [IsAuthenticated, IsEmployee]

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
                employees = health_institution.employees.select_related(
                    "user", "registered_at"
                )
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
                    username=create_username(
                        first_name=payload.validated_data.get("first_name"),
                        last_name=payload.validated_data.get("last_name"),
                    ),
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


class HealthInstitutionStatsView(APIView):
    permission_classes = (
        IsAuthenticated,
        IsEmployee,
    )

    def get(self, request):
        try:
            health_institution = request.user.employee.registered_at
            logger.info(health_institution)

            patients = health_institution.check_ins.filter(
                status=CheckInStatus.CHECKED_IN
            ).count()
            employees = health_institution.employees.count()
            rooms = health_institution.rooms.count()
            doctors = health_institution.employees.filter(
                user__role=UserRoles.DOCTOR
            ).count()
            nurses = health_institution.employees.filter(
                user__role=UserRoles.NURSE
            ).count()
            lab_technicians = health_institution.employees.filter(
                user__role=UserRoles.LAB_TECHNICIAN
            ).count()
            admins = health_institution.employees.filter(
                user__role=UserRoles.ADMIN
            ).count()

            statistics = {
                "patients": patients,
                "employees": employees,
                "rooms": rooms,
                "doctors": doctors,
                "nurses": nurses,
                "lab_technicians": lab_technicians,
                "admins": admins,
            }

            logger.info(statistics)

            return ApiResponse(data=statistics)
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class PatientCheckInStatisticsView(APIView):
    permission_classes = (IsAuthenticated, IsEmployee)

    def get(self, request):
        try:
            now = timezone.now()
            logger.info(now)
            period = request.query_params.get("period")
            logger.info(period)
            if period == "year":
                patient_checkins = (
                    PatientCheckIn.objects.filter(
                        created_at__year=now.year,
                        health_institution=request.user.employee.registered_at,
                    )
                    .annotate(month=TruncMonth("created_at"))
                    .values("month")
                    .annotate(count=Count("id"))
                )

                # change from queryset
                patient_checkins = list(patient_checkins)
                logger.info(patient_checkins)

                # fill in missing months with zeros
                for month in range(1, 13):
                    if not any(
                        patient_checkin["month"].month == month
                        for patient_checkin in patient_checkins
                    ):
                        patient_checkins.append(
                            {"month": now.replace(month=month), "count": 0}
                        )
            else:
                # group by day
                patient_checkins = (
                    PatientCheckIn.objects.filter(
                        created_at__month=now.month,
                        health_institution=request.user.employee.registered_at,
                    )
                    .annotate(day=TruncDay("created_at"))
                    .values("day")
                    .annotate(count=Count("id"))
                )

                patient_checkins = list(patient_checkins)
                logger.info(patient_checkins)

                end = calendar.monthrange(now.year, now.month)[1]
                for day in range(1, end):
                    if not any(
                        patient_checkin["day"].day == day
                        for patient_checkin in patient_checkins
                    ):
                        patient_checkins.append(
                            {"day": now.replace(day=day), "count": 0}
                        )

            return ApiResponse(data={"statistics": patient_checkins})
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)
