from rest_framework import serializers

from health_institution.models import HealthInstitution


class HealthInstitutionModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = HealthInstitution
        fields = "__all__"
