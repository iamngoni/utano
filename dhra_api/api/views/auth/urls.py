from api.views.auth.views import (
    SignInView,
    RefreshAuthView,
    DestroyTokenView,
    ForgotPasswordView,
    ResetPasswordView,
    UpdatePasswordView,
    PatientPreregistrationView,
    VerifyAccountView,
)
from django.urls import path

urlpatterns = [
    path(
        "preregistration",
        PatientPreregistrationView.as_view(),
        name="Patient Preregistration View",
    ),
    path("signin", SignInView.as_view(), name="sign-in"),
    path("refresh", RefreshAuthView.as_view(), name="Refresh Auth View"),
    path("destroy", DestroyTokenView.as_view(), name="Destroy Token View"),
    path("forgot_password", ForgotPasswordView.as_view(), name="Forgot Password View"),
    path("reset_password", ResetPasswordView.as_view(), name="Reset Password View"),
    path("update_password", UpdatePasswordView.as_view(), name="Update Password View"),
    path("verification", VerifyAccountView.as_view(), name="Verify Account View"),
]
