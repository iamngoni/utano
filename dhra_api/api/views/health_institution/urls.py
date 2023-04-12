from api.views.health_institution.views import (
    HealthInstitutionDetailsView,
    HealthInstitutionEmployeesView,
    HealthInstitutionStatsView,
    PatientCheckInStatisticsView,
)
from django.urls import path

from api.views.pos.views import PatientsView, PatientDetailsView

urlpatterns = [
    path(
        "details",
        HealthInstitutionDetailsView.as_view(),
        name="Health Institute Details View",
    ),
    path(
        "employees",
        HealthInstitutionEmployeesView.as_view(),
        name="Health Institution Employees View",
    ),
    path(
        "statistics",
        HealthInstitutionStatsView.as_view(),
        name="Health Institution Stats View",
    ),
    path(
        "checkin_statistics",
        PatientCheckInStatisticsView.as_view(),
        name="Patient CheckIn Statistics View",
    ),
    path("patients", PatientsView.as_view(), name="Patients View"),
    path(
        "patients/<str:patient_id>",
        PatientDetailsView.as_view(),
        name="Patient Details View",
    ),
]
