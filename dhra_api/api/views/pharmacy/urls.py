#
#  urls.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 17/4/2023.
#  Copyright (c) 2023 ModestNerds, Co

from django.urls import path

from api.views.pharmacy.views import (
    ApprovedMedicinesView,
    ApprovedMedicineDetailsView,
    DrugsView,
    DrugDetailsView,
)

urlpatterns = [
    path(
        "approved_medicines",
        ApprovedMedicinesView.as_view(),
        name="approved-medicines",
    ),
    path(
        "approved_medicines/<str:medicine_id>",
        ApprovedMedicineDetailsView.as_view(),
        name="approved-medicine-details",
    ),
    path("drugs", DrugsView.as_view(), name="drugs"),
    path("drugs/<str:drug_id>", DrugDetailsView.as_view(), name="drug-details"),
]
