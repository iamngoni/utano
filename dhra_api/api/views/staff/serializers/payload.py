from rest_framework import serializers
from phonenumber_field.serializerfields import PhoneNumberField

from health_institution.models import HealthInstitution
from system.models import District


class HealthInstitutionDetailsPayloadSerializer(serializers.Serializer):
    name = serializers.CharField(required=True)
    address = serializers.CharField(required=True)
    phone_number = PhoneNumberField(required=True)
    email = serializers.EmailField(required=True)
    logo = serializers.ImageField(required=True)
    district = serializers.CharField(required=True)

    def validate(self, attrs):
        health_institutions = HealthInstitution.objects.filter(name=attrs.get("name"))
        if health_institutions.count() > 0:
            raise serializers.ValidationError(
                {"name": "Health institution with name exists already"}
            )

        district = District.get_item_by_id(attrs.get("district"))
        if district is None:
            raise serializers.ValidationError({"district": "District does not exist"})
        attrs["district"] = district
        return attrs

    def create(self, validated_data):
        return super().create(validated_data)
