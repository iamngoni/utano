from api.views.health_institution.views import (
    HealthInstitutionDetailsView,
    HealthInstitutionEmployeesView,
    HealthInstitutionStatsView,
    PatientCheckInStatisticsView,
    PatientsView,
    PatientDetailsView,
    PrescriptionsView,
    PrescriptionDetailsView,
)
from django.urls import path

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
    path("prescriptions", PrescriptionsView.as_view(), name="prescriptions"),
    path(
        "prescriptions/<str:prescription_number>",
        PrescriptionDetailsView.as_view(),
        name="prescription-details",
    ),
]
