#
#  payload.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 17/4/2023.
#  Copyright (c) 2023 ModestNerds, Co
from rest_framework import serializers

from pharmacy.models import ApprovedMedicine, Drug


class DrugPayloadSerializer(serializers.Serializer):
    approved_medicine = serializers.CharField(
        required=True,
        error_messages={
            "required": "Please choose from approved medicines",
        },
    )
    price = serializers.DecimalField(max_digits=10, decimal_places=2, required=True)
    quantity = serializers.IntegerField(required=True, min_value=1)

    def validate(self, attrs):
        approved_medicine = ApprovedMedicine.get_item_by_id(
            attrs.get("approved_medicine")
        )
        if approved_medicine is None:
            raise serializers.ValidationError(
                {"approved_medicine": "Please choose from approved medicines"}
            )

        drugs = Drug.objects.filter(name=approved_medicine.name).exists()
        if drugs:
            raise serializers.ValidationError(
                {"approved_medicine": "Drug already exists in system"}
            )

        return attrs
