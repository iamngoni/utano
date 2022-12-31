from django.urls import path

from api.views.staff.views import RegisterHealthInstitutionView, HealthInstitutionsView

urlpatterns = [
    path(
        "register_health_institution",
        RegisterHealthInstitutionView.as_view(),
        name="Register Health Institution View",
    ),
    path(
        "health_institutions",
        HealthInstitutionsView.as_view(),
        name="Health Institutions View",
    ),
]
