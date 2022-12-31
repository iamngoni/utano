from rest_framework import serializers
from phonenumber_field.serializerfields import PhoneNumberField

from health_institution.models import HealthInstitution
from system.models import District
from django.db.models import Q


class HealthInstitutionDetailsPayloadSerializer(serializers.Serializer):
    name = serializers.CharField(required=True)
    address = serializers.CharField(required=True)
    phone_number = PhoneNumberField(required=True)
    email = serializers.EmailField(required=True)
    logo = serializers.ImageField(required=True)
    district = serializers.CharField(required=True)

    def validate(self, attrs):
        health_institutions = HealthInstitution.objects.filter(
            Q(name=attrs.get("name")) | Q(phone_number=attrs.get("phone_number"))
        )
        if health_institutions.count() > 0:
            raise serializers.ValidationError(
                {"name": "Health institution with name or phone number exists already"}
            )

        district = District.get_item_by_id(attrs.get("district"))
        if district is None:
            raise serializers.ValidationError({"district": "District does not exist"})
        attrs["district"] = district
        return attrs

    def create(self, validated_data):
        return super().create(validated_data)
