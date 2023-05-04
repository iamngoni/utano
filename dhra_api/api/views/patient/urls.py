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
    PatientLabTestRequestsView,
    PatientLabTestRequestDetailsView,
    HealthInstitutionsView,
    PatientCheckInView,
    PatientCheckInDetailsView,
    PatientPrescriptionsView,
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
        name="patient-emergency-contact-details",
    ),
    path(
        "test_requests",
        PatientLabTestRequestsView.as_view(),
        name="patient-lab-tests-requests",
    ),
    path(
        "test_requests/<str:test_request_id>",
        PatientLabTestRequestDetailsView.as_view(),
        name="patient-lab-tests-request-details",
    ),
    path(
        "health_institutions",
        HealthInstitutionsView.as_view(),
        name="health-institutions",
    ),
    path("checkins", PatientCheckInView.as_view(), name="patient-checkin"),
    path(
        "checkins/<str:check_in_id>",
        PatientCheckInDetailsView.as_view(),
        name="patient-checkin-details",
    ),
    path(
        "prescriptions",
        PatientPrescriptionsView.as_view(),
        name="patient-prescriptions",
    ),
]
