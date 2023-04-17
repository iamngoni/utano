#
#  model.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 17/4/2023.
#  Copyright (c) 2023 ModestNerds, Co
from rest_framework import serializers

from pharmacy.models import ApprovedMedicine, Drug


class ApprovedMedicineModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = ApprovedMedicine
        fields = "__all__"


class DrugModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Drug
        fields = "__all__"
