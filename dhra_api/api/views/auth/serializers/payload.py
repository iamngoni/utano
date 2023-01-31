from rest_framework import serializers
from django.contrib.auth.password_validation import validate_password

from users.models import User


class SignInPayloadSerializer(serializers.Serializer):
    username = serializers.CharField(required=True)
    password = serializers.CharField(required=True)


class RefreshTokenSerializer(serializers.Serializer):
    refresh_token = serializers.CharField(required=True)


class ForgotPasswordPayloadSerializer(serializers.Serializer):
    email = serializers.EmailField(required=True)


class ResetPasswordPayloadSerializer(serializers.Serializer):
    otp = serializers.CharField(required=True)
    password = serializers.CharField(required=True, validators=[validate_password])
    password_confirmation = serializers.CharField(
        required=True, validators=[validate_password]
    )

    def validate(self, attrs):
        try:
            validate_password(attrs["password"])
            if attrs["password"] != attrs["password_confirmation"]:
                raise serializers.ValidationError(
                    {"password": "Password fields didn't match."}
                )

            otp = attrs.get("otp")
            User.objects.get(one_time_pin=otp)
            return attrs
        except User.DoesNotExist:
            raise serializers.ValidationError({"otp": "OTP is invalid or expired"})


class UpdatePasswordPayloadSerializer(serializers.Serializer):
    old_password = serializers.CharField(required=True, validators=[validate_password])
    password = serializers.CharField(required=True, validators=[validate_password])
    password_confirmation = serializers.CharField(
        required=True, validators=[validate_password]
    )

    def validate(self, attrs):
        validate_password(attrs["password"])
        if attrs["old_password"] == attrs["password"]:
            raise serializers.ValidationError(
                "New password cannot be similar to current password"
            )
        if attrs["password"] != attrs["password_confirmation"]:
            raise serializers.ValidationError(
                {"password": "Password fields didn't match."}
            )

        return attrs
