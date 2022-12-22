from rest_framework.permissions import BasePermission
from users.models import UserRoles


class IsPatient(BasePermission):
    message = "You must be a patient to access this resource."

    def has_permission(self, request, view):
        return request.user.role == UserRoles.PATIENT
