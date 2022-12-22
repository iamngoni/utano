from rest_framework.permissions import BasePermission

from users.models import UserRoles


class HasActiveSubscription(BasePermission):
    message = "You don't have an active subscription"

    def has_permission(self, request, view):
        return request.user.patient_profile.has_active_subscription
