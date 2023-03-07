#
#  views.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co
from django.db import transaction
from loguru import logger
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView

from api.views.auth.tasks import (
    send_verification_code_to_user,
    send_welcome_note_to_patient,
)
from api.views.pos.serializers.model import PatientCheckInModelSerializer
from api.views.pos.serializers.payload import PatientCheckInPayloadSerializer
from pos.models import PatientCheckIn
from services.helpers.api_response import ApiResponse
from services.helpers.create_username import create_username
from services.helpers.generate_medical_record_number import (
    generate_medical_record_number,
)
from services.helpers.generate_random_password import generate_random_password
from services.permissions.is_employee import IsEmployee
from system.models import CheckInStatus
from users.models import Patient, User


class PatientCheckInView(APIView):
    permission_classes = (IsAuthenticated, IsEmployee)
    serializer_class = PatientCheckInPayloadSerializer

    @transaction.atomic()
    def post(self, request):
        try:
            payload = self.serializer_class(data=request.data)
            if payload.is_valid():
                logger.info("saving check in information")
                check_in = PatientCheckIn(
                    health_institution=request.user.employee.registered_at,
                    **payload.validated_data,
                )
                check_in.save()
                logger.success("check in information saved")

                # look for previous check ins  and set them as dismissed
                previous_check_ins = PatientCheckIn.objects.filter(
                    mobile_number=check_in.patient.mobile_number
                ).exclude(id=check_in.id)

                for check_in in previous_check_ins:
                    check_in.status = CheckInStatus.DISMISSED
                    check_in.save()

                if check_in.patient is None:
                    logger.info(
                        "information not related to any patient... creating a new patient profile"
                    )
                    # create patient and user
                    username = create_username(
                        first_name=check_in.first_name, last_name=check_in.last_name
                    )
                    logger.success("username generated")
                    password = generate_random_password()
                    logger.success("password generated")

                    email = f"{check_in.get_mobile_number}@utano.modestnerd.co"
                    logger.success("custom email generated")

                    user = User(
                        first_name=check_in.first_name,
                        last_name=check_in.last_name,
                        username=username,
                        gender=check_in.gender,
                        email=email,
                    )
                    user.set_password(password)
                    user.save()
                    logger.success("user account created")

                    logger.info("generating new mrn")
                    mrn = generate_medical_record_number()
                    logger.info("creating patient profile")
                    patient = Patient(
                        user=user,
                        medical_record_number=mrn,
                        date_of_birth=check_in.date_of_birth,
                        address=check_in.address,
                        mobile_number=check_in.mobile_number,
                        registered_at=request.user.employee.registered_at,
                    )
                    patient.save()
                    logger.success("patient profile successfully created")

                    # welcome user and send verification code
                    send_welcome_note_to_patient.delay(user)
                    send_verification_code_to_user.delay(user)
                else:
                    logger.info("information relates to an existing patient")

                return ApiResponse(
                    data={"check_in": PatientCheckInModelSerializer(check_in).data}
                )
            else:
                logger.error(payload.errors)
                return ApiResponse(
                    num_status=400, bool_status=False, issues=payload.errors
                )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)
