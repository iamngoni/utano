from django.urls import path, include
from rest_framework.schemas import get_schema_view
from rest_framework.renderers import CoreJSONRenderer


urlpatterns = [
    path("auth/", include("api.views.auth.urls")),
    path("health_institute/", include("api.views.health_institution.urls")),
    path(
        "docs",
        get_schema_view(
            title="Utano REST API",
            description="Utano REST API",
            version="1.0",
            renderer_classes=(CoreJSONRenderer,),
        ),
        name="Utano REST API",
    ),
]
