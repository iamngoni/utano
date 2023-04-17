#
#  payload.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from phonenumber_field.serializerfields import PhoneNumberField
from rest_framework import serializers

from health_institution.models import HealthInstitution
from system.models import RelationshipType


class EmergencyContactsPayloadSerializer(serializers.Serializer):
    first_name = serializers.CharField(required=True)
    last_name = serializers.CharField(required=True)
    mobile_number = PhoneNumberField(required=True)
    address = serializers.CharField(required=True)
    relationship = serializers.CharField(required=True)

    def validate(self, attrs):
        if attrs.get("relationship") not in RelationshipType.get_list_of_options():
            raise serializers.ValidationError(
                {"relationship": "Relationship type not recognized"}
            )

        return attrs


class TestRequestPayloadSerializer(serializers.Serializer):
    tests = serializers.CharField(required=True)
    request_notes = serializers.CharField(required=True)
    health_institution = serializers.CharField(required=True)

    def validate(self, attrs):
        health_institution = HealthInstitution.get_item_by_id(
            attrs.get("health_institution")
        )
        if health_institution is None:
            raise serializers.ValidationError(
                {"health_institution": "Health institution not recognized"}
            )

        return attrs
