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
)
from api.views.patient.serializers.payload import EmergencyContactsPayloadSerializer
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
