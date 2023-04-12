#
#  payload.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from rest_framework import serializers

from system.models import Gender
from users.models import User, UserRoles


class HealthInstitutionEmployeesPayloadSerializer(serializers.Serializer):
    first_name = serializers.CharField(required=True)
    last_name = serializers.CharField(required=True)
    email = serializers.EmailField(required=True)
    role = serializers.CharField(required=True)
    gender = serializers.CharField(required=True)

    def validate(self, attrs):
        users = User.objects.filter(email=attrs.get("email")).count()
        if users > 0:
            raise serializers.ValidationError({"email": "Email already in user"})

        if not attrs.get("role") in [
            UserRoles.ADMIN,
            UserRoles.NURSE,
            UserRoles.DOCTOR,
            UserRoles.LAB_TECHNICIAN,
            UserRoles.PHARMACIST,
        ]:
            raise serializers.ValidationError({"role": "Role not recognized"})

        if not attrs.get("gender") in Gender.get_list_of_options():
            raise serializers.ValidationError({"gender": "Gender not recognized"})

        return attrs
