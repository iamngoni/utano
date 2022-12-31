from rest_framework import serializers

from health_institution.models import HealthInstitution
from utano import settings


class HealthInstitutionModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = HealthInstitution
        fields = "__all__"

    def to_representation(self, instance):
        institution = super(HealthInstitutionModelSerializer, self).to_representation(
            instance
        )
        institution["logo"] = f"{settings.ORIGIN}{instance.logo.url}"
        return institution
