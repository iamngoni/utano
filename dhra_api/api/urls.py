from django.urls import path, include

urlpatterns = [
    path("auth/", include("api.views.auth.urls")),
]
