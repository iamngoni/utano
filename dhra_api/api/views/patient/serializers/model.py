#
#  model.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from rest_framework import serializers

from patient.models import EmergencyContact
from users.models import Patient, User


class UserModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = [
            "id",
            "last_login",
            "first_name",
            "last_name",
            "date_joined",
            "email",
            "is_active",
            "is_verified",
            "username",
            "role",
            "gender",
            "receive_email_notifications",
        ]


class PatientModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Patient
        fields = "__all__"
        depth = 2

    def to_representation(self, instance):
        patient = super(PatientModelSerializer, self).to_representation(instance)
        patient["user"] = UserModelSerializer(patient["user"]).data
        return patient


class EmergencyContactModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = EmergencyContact
        fields = "__all__"
