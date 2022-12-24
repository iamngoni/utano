from rest_framework import serializers

from users.models import User


class UserModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = [
            "id",
            "last_login",
            "is_superuser",
            "first_name",
            "last_name",
            "is_staff",
            "date_joined",
            "created_at",
            "updated_at",
            "is_active",
            "is_verified",
            "username",
            "role",
            "password_updated_at",
            "receive_email_notifications",
        ]
