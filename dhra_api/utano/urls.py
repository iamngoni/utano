from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path("admin/", admin.site.urls),
    path("jobs", include("django_rq.urls")),
    path("api/1.0/", include("api.urls")),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
