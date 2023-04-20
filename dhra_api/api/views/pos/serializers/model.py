#
#  model.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from rest_framework import serializers
from health_institution.models import HealthInstitution
from pos.models import PatientCheckIn, Prescription, PrescriptionItem
from system.models import District, Province
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

    def to_representation(self, instance):
        patient = super(PatientModelSerializer, self).to_representation(instance)
        patient["registered_at"] = HealthInstitutionModelSerializer(
            instance.registered_at
        ).data
        patient["user"] = UserModelSerializer(instance.user).data
        return patient


class PatientCheckInModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = PatientCheckIn
        fields = "__all__"

    def to_representation(self, instance):
        check_in = super(PatientCheckInModelSerializer, self).to_representation(
            instance
        )
        check_in["patient"] = PatientModelSerializer(instance.patient).data
        check_in["health_institution"] = HealthInstitutionModelSerializer(
            instance.health_institution
        ).data
        return check_in


class PrescriptionModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prescription
        fields = "__all__"

    def to_representation(self, instance):
        data = super().to_representation(instance)
        data["prescription_items"] = PrescriptionItemModelSerializer(
            instance.items, many=True
        ).data
        return data


class PrescriptionItemModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = PrescriptionItem
        fields = "__all__"


class HealthInstitutionModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = HealthInstitution
        fields = "__all__"

    def to_representation(self, instance):
        health_institution = super(
            HealthInstitutionModelSerializer, self
        ).to_representation(instance)
        health_institution["district"] = DistrictModelSerializer(instance.district).data
        return health_institution


class ProvinceModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Province
        fields = ["id", "name"]


class DistrictModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = District
        fields = ["id", "name"]

    def to_representation(self, instance):
        district = super(DistrictModelSerializer, self).to_representation(instance)
        district["province"] = ProvinceModelSerializer(instance.province).data
        return district
