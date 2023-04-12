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
from api.views.health_institution.serializers.model import PatientModelSerializer
from api.views.pos.serializers.model import (
    PatientCheckInModelSerializer,
    PrescriptionModelSerializer,
)
from api.views.pos.serializers.payload import (
    PatientCheckInPayloadSerializer,
    PrescriptionPayloadSerializer,
)
from pos.models import PatientCheckIn, Prescription, PrescriptionItem
from services.helpers.api_response import ApiResponse
from services.helpers.create_username import create_username
from services.helpers.generate_medical_record_number import (
    generate_medical_record_number,
)
from services.helpers.generate_prescription_number import generate_prescription_number
from services.helpers.generate_random_password import generate_random_password
from services.permissions.is_employee import IsEmployee
from system.models import CheckInStatus
from users.models import Patient, User
from api.views.pos.tasks import send_prescription_to_patient


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
                        height=check_in.height,
                        weight=check_in.weight,
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


class PatientCheckInPrescriptionView(APIView):
    permission_classes = (IsAuthenticated, IsEmployee)
    serializer_class = PrescriptionPayloadSerializer

    def get(self, request, check_in_id):
        try:
            check_in = PatientCheckIn.objects.get(id=check_in_id)
            try:

                return ApiResponse(
                    data={
                        "prescription": PrescriptionModelSerializer(
                            check_in.prescription
                        ).data
                    }
                )
            except Exception as exc:
                logger.error("probably prescription not found")
                logger.error(exc)
                return ApiResponse(num_status=404, bool_status=False)
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)

    @transaction.atomic()
    def post(self, request, check_in_id):
        try:
            payload = self.serializer_class(data=request.data)
            if payload.is_valid():
                check_in = PatientCheckIn.objects.get(id=check_in_id)
                # create a new prescription
                prescription_number = generate_prescription_number()

                prescription = Prescription(
                    patient=check_in.patient,
                    check_in=check_in,
                    prepared_at=check_in.health_institution,
                    prepared_by=request.user.employee,
                    notes=check_in.treatment_notes,
                    prescription_number=prescription_number,
                )
                prescription.save()

                for item in payload.validated_data.get("prescription_items"):
                    prescription_item = PrescriptionItem(
                        prescription=prescription,
                        medicine=item.get("medicine_name"),
                        medicine_id=item.get("medicine"),
                        quantity=item.get("quantity"),
                        frequency=item.get("frequency"),
                        instructions=item.get("instructions"),
                    )
                    prescription_item.save()

                send_prescription_to_patient.delay(prescription)

                return ApiResponse(
                    data={
                        "prescription": PrescriptionModelSerializer(prescription).data
                    }
                )
            else:
                logger.error(payload.errors)
                return ApiResponse(
                    num_status=400, bool_status=False, issues=payload.errors
                )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class PatientsView(APIView):
    permission_classes = (IsAuthenticated, IsEmployee)

    def get(self, request):
        try:
            patients = Patient.objects.filter(
                registered_at=request.user.employee.registered_at
            )
            return ApiResponse(
                data={
                    "patients": PatientModelSerializer(patients, many=True).data,
                }
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class PatientDetailsView(APIView):
    def get(self, request, patient_id):
        try:
            patient = Patient.get_item_by_id(patient_id)

            if patient is None:
                return ApiResponse(
                    num_status=404, bool_status=False, message="Patient not found"
                )

            return ApiResponse(data={"patient": PatientModelSerializer(patient).data})
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)
