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

from system.models import Gender


class PatientCheckInPayloadSerializer(serializers.Serializer):
    first_name = serializers.CharField(required=True)
    last_name = serializers.CharField(required=True)
    date_of_birth = serializers.DateField(required=False)
    age = serializers.IntegerField(required=False)
    address = serializers.CharField(required=True)
    mobile_number = PhoneNumberField(required=True, region="ZW")
    gender = serializers.CharField(required=True)

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
            setattr(attrs, "date_of_birth", date_of_birth)
            delattr(attrs, "age")

        if not attrs.get("gender") in Gender.get_list_of_options():
            raise serializers.ValidationError({"gender": "Gender not recognized"})

        return attrs
