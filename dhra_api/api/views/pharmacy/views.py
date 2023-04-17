#
#  views.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 17/4/2023.
#  Copyright (c) 2023 ModestNerds, Co

from loguru import logger
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView

from api.views.pharmacy.serializers.model import (
    ApprovedMedicineModelSerializer,
    DrugModelSerializer,
)
from api.views.pharmacy.serializers.payload import DrugPayloadSerializer
from pharmacy.models import ApprovedMedicine, Drug
from services.helpers.api_response import ApiResponse
from services.permissions.is_employee import IsEmployee


class ApprovedMedicinesView(APIView):
    permission_classes = (
        IsAuthenticated,
        IsEmployee,
    )

    def get(self, request):
        try:
            approved_medicines = ApprovedMedicine.objects.all()
            return ApiResponse(
                data={
                    "approved_medicines": ApprovedMedicineModelSerializer(
                        approved_medicines, many=True
                    ).data
                }
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class ApprovedMedicineDetailsView(APIView):
    permission_classes = (
        IsAuthenticated,
        IsEmployee,
    )

    def get(self, request, medicine_id):
        try:
            approved_medicine = ApprovedMedicine.get_item_by_id(medicine_id)
            if approved_medicine is None:
                return ApiResponse(
                    num_status=404, bool_status=False, message="Medicine not found"
                )

            return ApiResponse(
                data={
                    "approved_medicine": ApprovedMedicineModelSerializer(
                        approved_medicine
                    ).data
                }
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class DrugsView(APIView):
    permission_classes = (
        IsAuthenticated,
        IsEmployee,
    )
    serializer_class = DrugPayloadSerializer

    def get(self, request):
        try:
            drugs = Drug.objects.prefetch_related("history").all()
            return ApiResponse(
                data={"drugs": DrugModelSerializer(drugs, many=True).data}
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)

    def post(self, request):
        try:
            payload = self.serializer_class(data=request.data)
            if payload.is_valid():
                approved_medicine = ApprovedMedicine.get_item_by_id(
                    payload.validated_data.get("approved_medicine")
                )
                drug = Drug(
                    name=approved_medicine.name,
                    description=approved_medicine.description,
                    price=payload.validated_data.get("price"),
                    quantity=payload.validated_data.get("quantity"),
                )
                drug.save()

                drug.history.create(
                    description=f"Employee {request.user.employee.id} ({request.user.get_full_name()}) created"
                    f" {drug.name} priced at ${drug.price} x {drug.quantity}"
                )

                return ApiResponse(data={"drug": DrugModelSerializer(drug).data})
            else:
                logger.error(payload.errors)
                return ApiResponse(
                    num_status=400, bool_status=False, issues=payload.errors
                )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class DrugDetailsView(APIView):
    permission_classes = (
        IsAuthenticated,
        IsEmployee,
    )

    def get(self, request, drug_id):
        try:
            drug = Drug.get_item_by_id(drug_id)
            if drug is None:
                return ApiResponse(
                    num_status=404, bool_status=False, message="Drug not found"
                )

            return ApiResponse(data={"drug": DrugModelSerializer(drug).data})
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)
