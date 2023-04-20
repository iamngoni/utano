#
#  model.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from rest_framework import serializers

from health_institution.models import HealthInstitution
from lab.models import TestRequest
from patient.models import EmergencyContact
from pos.models import PatientCheckIn
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
        depth = 3

    def to_representation(self, instance):
        patient = super(PatientModelSerializer, self).to_representation(instance)
        patient["user"] = UserModelSerializer(patient["user"]).data
        return patient


class EmergencyContactModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = EmergencyContact
        fields = "__all__"


class PatientTestRequestModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = TestRequest
        fields = [
            "id",
            "tests",
            "request_notes",
            "lab_notes",
            "status",
            "scheduled_date",
            "created_at",
            "updated_at",
        ]

    def to_representation(self, instance):
        test_request = super(PatientTestRequestModelSerializer, self).to_representation(
            instance
        )
        test_request["health_institution"] = instance.health_institution.name
        return test_request


class HealthInstitutionModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = HealthInstitution
        fields = ["id", "name", "address", "phone_number", "logo", "email"]


class PatientCheckInModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = PatientCheckIn
        fields = "__all__"

    def to_representation(self, instance):
        checkin = super(PatientCheckInModelSerializer, self).to_representation(instance)
        checkin["health_institution"] = instance.health_institution.name
        return checkin
