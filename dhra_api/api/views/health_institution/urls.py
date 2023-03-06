from api.views.health_institution.views import (
    HealthInstitutionDetailsView,
    HealthInstitutionEmployeesView,
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
]
