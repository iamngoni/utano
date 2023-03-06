#
#  urls.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from django.urls import path

from api.views.system.views import ProvincesView, DistrictsView

urlpatterns = [
    path("provinces", ProvincesView.as_view(), name="Provinces View"),
    path("districts", DistrictsView.as_view(), name="Districts View"),
]
