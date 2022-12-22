from rest_framework.permissions import BasePermission
from users.models import UserRoles


class IsTherapist(BasePermission):
    message = "You must be a therapist to access this resource."

    def has_permission(self, request, view):
        return request.user.role == UserRoles.THERAPIST
