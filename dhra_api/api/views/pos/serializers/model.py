#
#  model.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from rest_framework import serializers

from pos.models import PatientCheckIn, Prescription, PrescriptionItem


class PatientCheckInModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = PatientCheckIn
        fields = "__all__"


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
