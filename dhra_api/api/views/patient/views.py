#
#  views.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from loguru import logger
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView

from api.views.patient.serializers.model import (
    PatientModelSerializer,
    EmergencyContactModelSerializer,
    PatientTestRequestModelSerializer,
)
from api.views.patient.serializers.payload import (
    EmergencyContactsPayloadSerializer,
    TestRequestPayloadSerializer,
)
from health_institution.models import HealthInstitution
from lab.models import TestRequest
from patient.models import EmergencyContact
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


class PatientEmergencyContactsView(APIView):
    permission_classes = (IsAuthenticated, IsPatient)
    serializer_class = EmergencyContactsPayloadSerializer

    def get(self, request):
        try:
            emergency_contacts = request.user.patient.contacts.all()
            return ApiResponse(
                data={
                    "emergency_contacts": EmergencyContactModelSerializer(
                        emergency_contacts, many=True
                    ).data
                }
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)

    def post(self, request):
        try:
            payload = self.serializer_class(data=request.data)
            if payload.is_valid():
                emergency_contact = EmergencyContact(
                    patient=request.user.patient, **payload.validated_data
                )
                emergency_contact.save()
                return ApiResponse(
                    data={
                        "emergency_contact": EmergencyContactModelSerializer(
                            emergency_contact
                        ).data
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


class PatientEmergencyContactDetailsView(APIView):
    permission_classes = (IsAuthenticated, IsPatient)
    serializer_class = EmergencyContactsPayloadSerializer

    def get(self, request, pk):
        try:
            emergency_contact = request.user.patient.contacts.get(id=pk)
            return ApiResponse(
                data={
                    "emergency_contact": EmergencyContactModelSerializer(
                        emergency_contact
                    ).data
                }
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)

    def put(self, request, pk):
        try:
            emergency_contact = request.user.patient.contacts.get(id=pk)

            for key, value in request.data.items():
                setattr(emergency_contact, key, value)

            emergency_contact.save()

            return ApiResponse(
                data={
                    "emergency_contact": EmergencyContactModelSerializer(
                        emergency_contact
                    ).data
                }
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)

    def delete(self, request, pk):
        try:
            emergency_contact = request.user.patient.contacts.get(id=pk)
            emergency_contact.delete()

            return ApiResponse()
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class PatientLabTestRequestsView(APIView):
    permission_classes = (
        IsAuthenticated,
        IsPatient,
    )
    serializer_class = TestRequestPayloadSerializer

    def get(self, request):
        try:
            test_requests = TestRequest.objects.filter(patient=request.user.patient)
            return ApiResponse(
                data={
                    "test_requests": PatientTestRequestModelSerializer(
                        test_requests, many=True
                    ).data
                }
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)

    def post(self, request):
        try:
            payload = self.serializer_class(data=request.data)
            if payload.is_valid():
                health_institution = HealthInstitution.get_item_by_id(
                    payload.validated_data.get("health_institution")
                )
                test_request = TestRequest(
                    patient=request.user.patient,
                    tests=payload.validated_data.get("tests"),
                    request_notes=payload.validated_data.get("request_notes"),
                    health_institution=health_institution,
                )
                test_request.save()

                return ApiResponse(
                    data={
                        "test_request": PatientTestRequestModelSerializer(
                            test_request
                        ).data
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


class PatientLabTestRequestDetailsView(APIView):
    permission_classes = (
        IsAuthenticated,
        IsPatient,
    )

    def get(self, request, test_request_id):
        try:
            test_request = TestRequest.get_item_by_id(test_request_id)

            if test_request is None:
                return ApiResponse(
                    num_status=404, bool_status=False, message="Test request not found"
                )

            return ApiResponse(
                data={
                    "test_request": PatientTestRequestModelSerializer(test_request).data
                }
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)

    def delete(self, request, test_request_id):
        try:
            test_request = TestRequest.get_item_by_id(test_request_id)
            if test_request is None:
                return ApiResponse(
                    num_status=404, bool_status=False, message="Test request not found"
                )

            test_request.delete()
            return ApiResponse(message="Request cancelled")
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)
