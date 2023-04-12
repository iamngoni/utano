from rest_framework import serializers

from health_institution.models import HealthInstitution
from users.models import Employee, User, Patient


class HealthInstitutionModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = HealthInstitution
        fields = "__all__"
        depth = 2


class EmployeeModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        fields = "__all__"
        depth = 3


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
