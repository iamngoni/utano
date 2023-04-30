#
#  urls.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 17/4/2023.
#  Copyright (c) 2023 ModestNerds, Co

from django.urls import path

from api.views.payments.views import DispensaryPaymentsView

urlpatterns = [
    path("dispensary", DispensaryPaymentsView.as_view(), name="dispensary-payments"),
]
