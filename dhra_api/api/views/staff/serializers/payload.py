from rest_framework import serializers
from phonenumber_field.serializerfields import PhoneNumberField

from health_institution.models import HealthInstitution
from system.models import District, Gender
from django.db.models import Q

from users.models import User


class HealthInstitutionDetailsPayloadSerializer(serializers.Serializer):
    name = serializers.CharField(required=True)
    address = serializers.CharField(required=True)
    phone_number = PhoneNumberField(required=True)
    email = serializers.EmailField(required=True)
    logo = serializers.ImageField(required=True)
    district = serializers.CharField(required=True)

    def validate(self, attrs):
        health_institutions = HealthInstitution.objects.filter(
            Q(name=attrs.get("name"))
            | Q(phone_number=attrs.get("phone_number"))
            | Q(email=attrs.get("email"))
        )
        if health_institutions.count() > 0:
            raise serializers.ValidationError(
                {
                    "name": "Health institution with name or phone number or email exists already"
                }
            )

        district = District.get_item_by_id(attrs.get("district"))
        if district is None:
            raise serializers.ValidationError({"district": "District does not exist"})
        attrs["district"] = district
        return attrs

    def create(self, validated_data):
        return super().create(validated_data)


class HealthInstitutionAdminPayloadSerializer(serializers.Serializer):
    email = serializers.EmailField(required=True)
    gender = serializers.CharField(required=True)
    first_name = serializers.CharField(required=True)
    last_name = serializers.CharField(required=True)

    def validate(self, attrs):
        users = User.objects.filter(email=attrs.get("email"))
        if len(users) > 0:
            raise serializers.ValidationError(
                {"email": "User with email already exists"}
            )

        allowed_genders = Gender.get_list_of_options()
        if not (attrs.get("gender") in allowed_genders):
            raise serializers.ValidationError(
                {"gender": f"Choose from available gender options: {allowed_genders}"}
            )

        return attrs

    def create(self, validated_data):
        return super().create(validated_data)
