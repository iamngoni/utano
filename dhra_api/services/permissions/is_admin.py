from rest_framework.permissions import BasePermission

from users.models import UserRoles


class IsAdmin(BasePermission):
    message = "You must be an admin to access this resource."

    def has_permission(self, request, view):
        return request.user.role == UserRoles.ADMIN
