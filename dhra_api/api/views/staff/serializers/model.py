from rest_framework import serializers

from health_institution.models import HealthInstitution
from users.models import Employee, User
from utano import settings


class HealthInstitutionModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = HealthInstitution
        fields = "__all__"
        depth = 2

    def to_representation(self, instance):
        institution = super(HealthInstitutionModelSerializer, self).to_representation(
            instance
        )
        institution["logo"] = f"{settings.ORIGIN}{instance.logo.url}"
        return institution


class UserModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = [
            "id",
            "last_login",
            "is_superuser",
            "first_name",
            "last_name",
            "is_staff",
            "date_joined",
            "created_at",
            "updated_at",
            "is_active",
            "is_verified",
            "username",
            "role",
            "password_updated_at",
            "receive_email_notifications",
        ]


class EmployeeModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        fields = "__all__"
        depth = 3

    def to_representation(self, instance):
        employee = super(EmployeeModelSerializer, self).to_representation(instance)
        employee["user"] = UserModelSerializer(instance.user).data
        return employee
