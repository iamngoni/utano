from rest_framework import serializers

from health_institution.models import HealthInstitution
from users.models import Employee


class HealthInstitutionModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = HealthInstitution
        fields = "__all__"


class EmployeeModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        fields = "__all__"
        depth = 2
