from rest_framework.permissions import BasePermission


class IsPasswordChanged(BasePermission):
    message = "Password has to be changed from the default password!"

    def has_permission(self, request, view):
        user = request.user
        password = f"{user.username}@uhuru"
        if user.check_password(password):
            return False

        return True
