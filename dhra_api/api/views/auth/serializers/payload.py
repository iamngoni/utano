from phonenumber_field.serializerfields import PhoneNumberField
from rest_framework import serializers
from django.contrib.auth.password_validation import validate_password

from system.models import Gender, MaritalStatus, EmploymentStatus
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


class PreregistrationPayloadSerializer(serializers.Serializer):
    first_name = serializers.CharField(required=True)
    last_name = serializers.CharField(required=True)
    email = serializers.EmailField(required=False)
    mobile_number = PhoneNumberField(required=True)
    gender = serializers.CharField(required=True)
    date_of_birth = serializers.DateField(required=True)
    marital_status = serializers.CharField(required=False)
    national_id_number = serializers.CharField(required=False)
    address = serializers.CharField(required=False)
    employment_status = serializers.CharField(required=False)
    password = serializers.CharField(required=True, validators=[validate_password])
    password_confirmation = serializers.CharField(
        required=True, validators=[validate_password]
    )

    def validate(self, attrs):
        if attrs.get("password") != attrs.get("password_confirmation"):
            raise serializers.ValidationError(
                {"password": "Password fields didn't match."}
            )

        users = User.objects.filter(email=attrs.get("email"))
        if len(users) > 0:
            raise serializers.ValidationError({"email": "Email already in use"})

        if not attrs.get("gender") in Gender.get_list_of_options():
            raise serializers.ValidationError(
                {"gender": "Specified gender not acceptable"}
            )

        if not attrs.get("email"):
            email = f"{attrs.get('mobile_number')}@utano.modestnerd.co"
            setattr(attrs, "email", email)

        if (
            attrs.get("marital_status")
            and not attrs.get("marital_status") in MaritalStatus.get_list_of_options()
        ):
            raise serializers.ValidationError(
                {"marital_status": "Marital status not recognized"}
            )

        if (
            attrs.get("employment_status")
            and not attrs.get("employment_status")
            in EmploymentStatus.get_list_of_options()
        ):
            raise serializers.ValidationError(
                {"employment_status": "Employment status not recognized"}
            )

        return attrs


class AccountVerificationPayloadSerializer(serializers.Serializer):
    otp = serializers.CharField(required=True, max_length=6)
