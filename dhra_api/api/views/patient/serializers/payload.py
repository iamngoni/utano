#
#  payload.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from phonenumber_field.serializerfields import PhoneNumberField
from rest_framework import serializers

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
