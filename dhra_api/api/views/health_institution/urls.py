from api.views.health_institution.views import (
    HealthInstitutionDetailsView,
    HealthInstitutionEmployeesView,
    HealthInstitutionStatsView,
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
]
