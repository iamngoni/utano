from api.views.auth.views import SignInView
from django.urls import path

urlpatterns = [
    path("signin", SignInView.as_view(), name="Sign In View"),
]
