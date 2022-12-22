from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include
from rest_framework.schemas import get_schema_view

urlpatterns = [
  path("admin", admin.site.urls),
  path("jobs", include("django_rq.urls")),
  path("api/1.0/", include("api.urls")),
  path(
      "docs",
      get_schema_view(
          title="Utano API",
          description="Utano REST API",
          version="1.0",
      ),
      name="open-api schema",
  ),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
