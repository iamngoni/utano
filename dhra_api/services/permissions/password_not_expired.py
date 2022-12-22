from django.utils import timezone
from rest_framework.permissions import BasePermission


class PasswordNotExpired(BasePermission):
    message = "Password has expired. Update your password!"

    def has_permission(self, request, view):
        current_time = timezone.now()
        print("CURRENT TIME: ", current_time)
        last_password_updated = request.user.password_updated_at
        print("USER PASSWORD LAST UPDATED ON: ", last_password_updated)
        delta = current_time.date() - last_password_updated.date()
        if delta.days >= 180:
            print("USER PASSWORD NEEDS TO BE UPDATED")
            return False

        return True
