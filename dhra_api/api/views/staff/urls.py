from django.urls import path

from api.views.staff.views import (
    HealthInstitutionsView,
    HealthInstitutionAdminsView,
    HealthInstitutionEmployeesView,
)

urlpatterns = [
    path(
        "health_institutions",
        HealthInstitutionsView.as_view(),
        name="Health Institutions View",
    ),
    path(
        "health_institutions/<str:health_institution_id>/admins",
        HealthInstitutionAdminsView.as_view(),
        name="Health Institution Admins View",
    ),
    path(
        "health_institutions/<str:health_institution_id>/employees",
        HealthInstitutionEmployeesView.as_view(),
        name="Health Institution Employees View",
    ),
]
