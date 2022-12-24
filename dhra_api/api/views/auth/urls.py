from api.views.auth.views import SignInView, RefreshAuthView, DestroyTokenView
from django.urls import path

urlpatterns = [
    path("signin", SignInView.as_view(), name="Sign In View"),
    path("refresh", RefreshAuthView.as_view(), name="Refresh Auth View"),
    path("destroy", DestroyTokenView.as_view(), name="Destroy Token View"),
]
