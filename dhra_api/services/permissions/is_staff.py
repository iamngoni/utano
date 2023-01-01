from rest_framework.permissions import BasePermission

from users.models import UserRoles


class IsStaff(BasePermission):
    message = "You must be a staff member to access this resource."

    def has_permission(self, request, view):
        return request.user.role in [UserRoles.ADMIN, UserRoles.SYSTEM_ADMIN]
