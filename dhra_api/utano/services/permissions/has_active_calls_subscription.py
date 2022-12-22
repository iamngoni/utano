from rest_framework.permissions import BasePermission


class HasActiveCallsSubscription(BasePermission):
    message = "Your subscription does not support audio or video calls."

    def has_permission(self, request, view):
        active_subscription = request.user.patient_profile.active_subscription
        if active_subscription is None:
            return False
        return (
            active_subscription.subscription_plan.subscription.has_live_sessions_capabilities
        )
