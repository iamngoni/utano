from django.urls import path

from api.views.staff.views import RegisterHealthInstitutionView

urlpatterns = [
    path(
        "register_health_institution",
        RegisterHealthInstitutionView.as_view(),
        name="Register Health Institution View",
    ),
]
