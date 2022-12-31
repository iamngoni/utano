from api.views.health_institution.views import HealthInstituteDetailsView
from django.urls import path

urlpatterns = [
    path(
        "details",
        HealthInstituteDetailsView.as_view(),
        name="Health Institute Details View",
    ),
]
