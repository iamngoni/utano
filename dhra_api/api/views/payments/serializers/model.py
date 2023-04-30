#
#  model.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 26/4/2023.
#  Copyright (c) 2023 ModestNerds, Co

from rest_framework import serializers

from payments.models import Payment


class PaymentModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Payment
        fields = "__all__"
