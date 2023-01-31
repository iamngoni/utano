from api.views.auth.views import (
    SignInView,
    RefreshAuthView,
    DestroyTokenView,
    ForgotPasswordView,
    ResetPasswordView,
    UpdatePasswordView,
)
from django.urls import path

urlpatterns = [
    path("signin", SignInView.as_view(), name="Sign In View"),
    path("refresh", RefreshAuthView.as_view(), name="Refresh Auth View"),
    path("destroy", DestroyTokenView.as_view(), name="Destroy Token View"),
    path("forgot_password", ForgotPasswordView.as_view(), name="Forgot Password View"),
    path("reset_password", ResetPasswordView.as_view(), name="Reset Password View"),
    path("update_password", UpdatePasswordView.as_view(), name="Update Password View"),
]
