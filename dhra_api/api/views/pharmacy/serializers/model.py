#
#  model.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 17/4/2023.
#  Copyright (c) 2023 ModestNerds, Co
from rest_framework import serializers

from pharmacy.models import ApprovedMedicine, Drug, DrugHistory


class ApprovedMedicineModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = ApprovedMedicine
        fields = "__all__"


class DrugHistoryModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = DrugHistory
        fields = "__all__"


class DrugModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Drug
        fields = "__all__"

    def to_representation(self, instance):
        drug = super(DrugModelSerializer, self).to_representation(instance)
        drug["history"] = DrugHistoryModelSerializer(instance.history, many=True).data
        del drug["health_institution"]
        return drug
