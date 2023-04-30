#
#  views.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 26/4/2023.
#  Copyright (c) 2023 ModestNerds, Co
from django.db import transaction
from loguru import logger
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView

from api.views.payments.serializers.model import PaymentModelSerializer
from api.views.payments.serializers.payload import DispensaryPaymentSerializer
from payments.models import Payment
from pharmacy.models import Dispense
from services.helpers.api_response import ApiResponse
from services.helpers.paynow_service import PaynowService
from services.permissions.is_employee import IsEmployee
from system.models import PaymentMethod, SystemStatus


class DispensaryPaymentsView(APIView):
    permission_classes = (
        IsAuthenticated,
        IsEmployee,
    )
    serializer_class = DispensaryPaymentSerializer

    @transaction.atomic
    def post(self, request):
        payload = self.serializer_class(data=request.data)
        if payload.is_valid():
            dispense = Dispense.get_item_by_id(payload.validated_data.get("dispense"))
            if dispense is None:
                return ApiResponse(
                    num_status=404,
                    bool_status=False,
                    message="Dispense not found in system",
                )

            payment = None

            if dispense.payment is not None and dispense.payment.paid is True:
                # check if payment has already been paid
                return ApiResponse(
                    num_status=400,
                    bool_status=False,
                    message="Item had already been paid for",
                )

            payment = Payment(
                amount=dispense.total_cost,
                rtgs_amount=dispense.total_rtgs_cost,
                description=f"Dispensary Payment: {dispense.id}",
                payment_method=payload.validated_data.get("payment_method"),
                patient_name=dispense.prescription.patient.user.get_full_name(),
                patient_email=dispense.prescription.patient.user.email,
                patient_phone=payload.validated_data.get("phone")
                if payload.validated_data.get("phone")
                else dispense.prescription.patient.phone,
                paid=True
                if (
                    payload.validated_data.get("payment_method")
                    not in [PaymentMethod.ECOCASH, PaymentMethod.SWIPE]
                )
                else False,
                status=SystemStatus.COMPLETED
                if (
                    payload.validated_data.get("payment_method")
                    not in [PaymentMethod.ECOCASH, PaymentMethod.SWIPE]
                )
                else SystemStatus.PENDING,
            )
            payment.save()

            dispense.payment = payment
            dispense.save()

            paynow_service = PaynowService(payment=payment)
            if paynow_service.process_dispensary_payment(dispense=dispense):
                return ApiResponse(
                    num_status=201,
                    bool_status=True,
                    message="Payment created successfully",
                    data={
                        "payment": PaymentModelSerializer(payment).data,
                    },
                )
            else:
                return ApiResponse(
                    num_status=400,
                    bool_status=False,
                    message="Payment creation failed",
                )
        else:
            logger.error(payload.errors)
            return ApiResponse(
                num_status=400,
                bool_status=False,
                issues=payload.errors,
            )
