#
#  urls.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from django.urls import path

from api.views.pos.views import PatientCheckInView, PatientCheckInPrescriptionView

urlpatterns = [
    path("check-in", PatientCheckInView.as_view(), name="Patient Check In View"),
    path(
        "check-in/<str:check_in_id>",
        PatientCheckInPrescriptionView.as_view(),
        name="Patient Check In Prescription View",
    ),
]
