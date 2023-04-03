#
#  urls.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from django.urls import path

from api.views.patient.views import (
    PatientDetailsView,
    PatientEmergencyContactsView,
    PatientEmergencyContactDetailsView,
)

urlpatterns = [
    path("details", PatientDetailsView.as_view(), name="Patient Details View"),
    path(
        "emergency_contacts",
        PatientEmergencyContactsView.as_view(),
        name="Patient Emergency Contacts View",
    ),
    path(
        "emergency_contacts/<str:pk>",
        PatientEmergencyContactDetailsView.as_view(),
        name="Patient Emergency Contact Details View",
    ),
]
