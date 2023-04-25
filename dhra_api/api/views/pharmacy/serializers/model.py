#
#  model.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 17/4/2023.
#  Copyright (c) 2023 ModestNerds, Co
from rest_framework import serializers

from pharmacy.models import ApprovedMedicine, Drug, DrugHistory, Dispense, DispenseItem


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


class DispenseModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Dispense
        fields = "__all__"

    def to_representation(self, instance):
        dispense = super(DispenseModelSerializer, self).to_representation(instance)
        dispense["items"] = DispenseItemModelSerializer(instance.items, many=True).data
        dispense["total_cost"] = instance.cost
        return dispense


class DispenseItemModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = DispenseItem
        fields = ["drug", "quantity"]

    def to_representation(self, instance):
        dispense_item = super(DispenseItemModelSerializer, self).to_representation(
            instance
        )
        dispense_item["drug"] = instance.drug.name
        return dispense_item
