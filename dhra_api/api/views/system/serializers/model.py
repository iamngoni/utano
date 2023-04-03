#
#  model.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from rest_framework import serializers

from system.models import Province, District, ApiRequest


class ProvinceModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Province
        fields = "__all__"

    def to_representation(self, instance):
        return {
            "id": instance.id,
            "name": instance.name,
            "districts": DistrictModelSerializer(instance.districts, many=True).data,
        }


class DistrictModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = District
        fields = ["id", "name"]


class ApiRequestModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = ApiRequest
        fields = "__all__"
