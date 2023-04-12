#
#  payload.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

import datetime

from django.utils import timezone
from loguru import logger
from phonenumber_field.serializerfields import PhoneNumberField
from rest_framework import serializers

from pharmacy.models import Drug, ApprovedMedicine
from system.models import Gender


class PatientCheckInPayloadSerializer(serializers.Serializer):
    first_name = serializers.CharField(required=True)
    last_name = serializers.CharField(required=True)
    date_of_birth = serializers.DateField(required=False)
    age = serializers.IntegerField(required=False)
    address = serializers.CharField(required=True)
    mobile_number = PhoneNumberField(required=True, region="ZW")
    gender = serializers.CharField(required=True)
    temperature = serializers.FloatField(required=True)
    systolic_blood_pressure = serializers.FloatField(required=True)
    diastolic_blood_pressure = serializers.FloatField(required=True)
    pulse = serializers.FloatField(required=True)
    respiratory_rate = serializers.FloatField(required=False)
    patient_notes = serializers.CharField(required=True)
    examination_notes = serializers.CharField(required=True)
    diagnosis_notes = serializers.CharField(required=True)
    treatment_notes = serializers.CharField(required=True)
    height = serializers.DecimalField(required=False, max_digits=5, decimal_places=2)
    weight = serializers.DecimalField(required=False, max_digits=5, decimal_places=2)


def validate(self, attrs):
    if not attrs.get("date_of_birth") and not attrs.get("age"):
        raise serializers.ValidationError(
            {"date_of_birth": "Either date of birth or age is required"}
        )

    if not attrs.get("date_of_birth") and attrs.get("age"):
        # approximate date of birth using provided age (current date - age)
        days = 365.25 * attrs.get("age")
        logger.info(days)
        date_of_birth = timezone.now() - datetime.timedelta(days=days)
        logger.info(f"generated date of birth: {date_of_birth}")
        attrs["date_of_birth"] = date_of_birth.date()
        del attrs["age"]
        logger.success("date of birth generated successfully")

    if not attrs.get("gender") in Gender.get_list_of_options():
        raise serializers.ValidationError({"gender": "Gender not recognized"})

    return attrs


class PrescriptionItemPayloadSerializer(serializers.Serializer):
    medicine = serializers.CharField(required=True)
    frequency = serializers.IntegerField(required=True, min_value=1)
    quantity = serializers.IntegerField(required=True, min_value=1)
    instructions = serializers.CharField(required=True)

    def validate(self, attrs):
        if attrs.get("frequency") > 4:
            raise serializers.ValidationError(
                {"frequency": "Frequency cannot be more than 4 times a day"}
            )

        # check if drug exists in the system
        medicines = ApprovedMedicine.objects.filter(id=attrs.get("medicine"))
        if not medicines.exists():
            raise serializers.ValidationError(
                {"medicine": "Medicine not found in approved list"}
            )

        attrs["medicine_name"] = medicines.first().name

        return attrs


class PrescriptionPayloadSerializer(serializers.Serializer):
    prescription_items = serializers.ListField(
        required=True,
        child=PrescriptionItemPayloadSerializer(required=True),
        min_length=1,
    )
