#
#  payload.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 17/4/2023.
#  Copyright (c) 2023 ModestNerds, Co

from rest_framework import serializers

from pharmacy.models import ApprovedMedicine, Drug
from pos.models import Prescription


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


class ProcessPrescriptionItemSerializer(serializers.Serializer):
    drug_id = serializers.CharField(required=True)
    quantity = serializers.IntegerField(required=True, min_value=1)

    def validate(self, attrs):
        drug = Drug.get_item_by_id(attrs.get("drug_id"))
        if drug is None:
            raise serializers.ValidationError({"drug_id": "Drug not found in system"})
        return attrs


class ProcessPrescriptionSerializer(serializers.Serializer):
    prescription_id = serializers.CharField(required=True)
    items = serializers.ListField(
        child=ProcessPrescriptionItemSerializer(), required=True
    )

    def validate(self, attrs):
        prescription = Prescription.get_item_by_id(attrs.get("prescription_id"))
        if prescription is None:
            raise serializers.ValidationError(
                {"prescription_id": "Prescription not found"}
            )

        # check if all prescription items exist in prescription items from db
        prescription_items = prescription.items.all()
        for item in attrs.get("items"):
            drug = Drug.get_item_by_id(item.get("drug_id"))
            if drug is None:
                raise serializers.ValidationError(
                    {"drug_id": "Drug not found in system"}
                )
            if not prescription_items.filter(medicine_id=drug.medicine.id).exists():
                raise serializers.ValidationError(
                    {"drug_id": "Drug not found in prescription"}
                )

        return attrs
