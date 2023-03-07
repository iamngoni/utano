#
#  model.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from rest_framework import serializers

from pos.models import PatientCheckIn


class PatientCheckInModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = PatientCheckIn
        fields = "__all__"
