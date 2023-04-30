#
#  payload.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 26/4/2023.
#  Copyright (c) 2023 ModestNerds, Co

from rest_framework import serializers

from pharmacy.models import Dispense
from system.models import PaymentMethod


class DispensaryPaymentSerializer(serializers.Serializer):
    dispense = serializers.CharField(required=True)
    payment_method = serializers.CharField(required=True)
    phone = serializers.CharField(required=False)

    def validate(self, attrs):

        dispense = Dispense.get_item_by_id(attrs.get("dispense"))
        if dispense is None:
            raise serializers.ValidationError(
                {"dispense": "Dispense not found in system"}
            )

        accepted_payments = [
            PaymentMethod.ECOCASH,
            PaymentMethod.CASH,
            PaymentMethod.BOND,
            PaymentMethod.ONEMONEY,
            PaymentMethod.SWIPE,
        ]
        if attrs.get("payment_method") not in accepted_payments:
            raise serializers.ValidationError(
                {"payment_method": "Payment method not supported"}
            )

        if (
            attrs.get("payment_method") == PaymentMethod.ECOCASH
            or attrs.get("payment_method") == PaymentMethod.ONEMONEY
        ):
            if attrs.get("phone") is None:
                raise serializers.ValidationError(
                    {"phone": "Please provide phone number"}
                )
            if len(attrs.get("phone")) != 10:
                raise serializers.ValidationError(
                    {"phone": "Please provide valid phone number"}
                )

        return attrs
