from django.db import transaction

from api.views.auth.serializers.model import UserModelSerializer
from api.views.auth.serializers.payload import (
    SignInPayloadSerializer,
    RefreshTokenSerializer,
    ForgotPasswordPayloadSerializer,
    ResetPasswordPayloadSerializer,
    UpdatePasswordPayloadSerializer,
    PreregistrationPayloadSerializer,
    AccountVerificationPayloadSerializer,
)
from rest_framework.parsers import JSONParser
from rest_framework.renderers import JSONRenderer
from rest_framework.views import APIView
from django.contrib.auth import authenticate
from loguru import logger
import jwt
from decouple import config
from django.utils import timezone

from auth0.models import BlacklistToken
from services.exceptions.passwords import PasswordUsedException
from services.helpers.api_response import ApiResponse
from services.helpers.create_username import create_username
from services.helpers.generate_medical_record_number import (
    generate_medical_record_number,
)
from services.helpers.get_client_details import get_client_details
from services.jwt_service import generate_jwt_payload
from api.views.auth.tasks import (
    notify_user_about_login_activity,
    send_verification_code_to_user,
    send_password_reset_otp,
    notify_user_that_their_password_has_been_updated,
    send_welcome_note_to_patient,
)
from users.models import User, UserRoles, Patient
from rest_framework.permissions import IsAuthenticated


class SignInView(APIView):
    renderer_classes = [JSONRenderer]
    parser_classes = [JSONParser]
    serializer_class = SignInPayloadSerializer
    authentication_classes = ()

    def post(self, request):
        try:
            payload = self.serializer_class(data=request.data)

            if payload.is_valid():
                username = payload.data.get("username")
                password = payload.data.get("password")

                user = authenticate(username=username, password=password)

                logger.info("USER: ", user)

                if user is None:
                    return ApiResponse(
                        num_status=401,
                        bool_status=False,
                        message="Incorrect username/email or password",
                    )

                if user is not None:
                    jwt_payload = generate_jwt_payload(user)

                    access_token = jwt.encode(
                        payload=jwt_payload["access"],
                        key=config("JWT_SECRET"),
                        algorithm="HS256",
                    )
                    refresh_token = jwt.encode(
                        payload=jwt_payload["refresh"],
                        key=config("JWT_SECRET"),
                        algorithm="HS256",
                    )

                    # notify user of login activity
                    details = get_client_details(request)
                    notify_user_about_login_activity.delay(user, details)

                    # if user hasn't been verified send another otp code
                    if not user.is_verified:
                        send_verification_code_to_user.delay(request.user)

                    return ApiResponse(
                        data={
                            "access_token": access_token,
                            "refresh_token": refresh_token,
                            "user": UserModelSerializer(user).data,
                        },
                    )

                else:
                    return ApiResponse(
                        num_status=401,
                        bool_status=False,
                        message="No user found",
                    )
            else:
                return ApiResponse(
                    num_status=400,
                    bool_status=False,
                    issues=payload.errors,
                )
        except Exception as e:
            logger.error(f" {e}")
            return ApiResponse(num_status=500, bool_status=False)


class RefreshAuthView(APIView):
    renderer_classes = (JSONRenderer,)
    parser_classes = (JSONParser,)
    authentication_classes = ()
    serializer_class = RefreshTokenSerializer

    def post(self, request):
        payload = self.serializer_class(data=request.data)

        if payload.is_valid():
            refresh_token = payload.data.get("refresh_token")

            try:
                decoded_refresh_token = jwt.decode(
                    jwt=refresh_token,
                    key=config("JWT_SECRET"),
                    options={"require": ["exp", "iat", "iss"]},
                    algorithms=["HS256"],
                )

                if decoded_refresh_token.get("type") != "refresh":
                    return ApiResponse(
                        num_status=401,
                        bool_status=False,
                        message="Incorrect token type",
                    )

                user_id = decoded_refresh_token.get("id")
                user = User.get_item_by_id(pk=user_id)

                if user is not None:

                    # destroy old token
                    authorization_header = request.headers.get("Authorization")
                    token = authorization_header.split(" ")[1]

                    blacklist = BlacklistToken(token=token)
                    blacklist.save()

                    jwt_payload = generate_jwt_payload(user=user)
                    access_token = jwt.encode(
                        payload=jwt_payload["access"],
                        key=config("JWT_SECRET"),
                        algorithm="HS256",
                    )
                    refresh_token = jwt.encode(
                        payload=jwt_payload["refresh"],
                        key=config("JWT_SECRET"),
                        algorithm="HS256",
                    )

                    return ApiResponse(
                        data={
                            "access_token": access_token,
                            "refresh_token": refresh_token,
                            "user": UserModelSerializer(user).data,
                        },
                    )
                else:
                    return ApiResponse(
                        num_status=404,
                        bool_status=False,
                        message="No user associated with token",
                    )

            except Exception as e:
                logger.error(f" {e}")
                return ApiResponse(num_status=500, bool_status=False)

        else:
            return ApiResponse(
                num_status=400,
                bool_status=False,
                issues=payload.errors,
            )


class DestroyTokenView(APIView):
    renderer_classes = [JSONRenderer]
    parser_classes = [JSONParser]
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        try:
            authorization_header = request.headers.get("Authorization")
            token = authorization_header.split(" ")[1]

            blacklist = BlacklistToken(token=token)
            blacklist.save()

            return ApiResponse()
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class ForgotPasswordView(APIView):
    parser_classes = (JSONParser,)
    renderer_classes = (JSONRenderer,)
    authentication_classes = ()
    serializer_class = ForgotPasswordPayloadSerializer

    def post(self, request):
        try:
            payload = self.serializer_class(data=request.data)
            if payload.is_valid():
                user = User.objects.get(email=payload.data.get("email"))
                user.generate_one_time_pin()
                user.save()

                send_password_reset_otp.delay(user)
                return ApiResponse()
            else:
                logger.error(f" {payload.errors}")
                return ApiResponse(
                    num_status=400,
                    bool_status=False,
                    issues=payload.errors,
                )
        except User.DoesNotExist:
            logger.error(" User does not exist")
            return ApiResponse()
        except Exception as e:
            logger.error(f" {e}")
            return ApiResponse(num_status=500, bool_status=False)


class ResetPasswordView(APIView):
    parser_classes = (JSONParser,)
    renderer_classes = (JSONRenderer,)
    authentication_classes = ()
    serializer_class = ResetPasswordPayloadSerializer

    def post(self, request):
        try:
            payload = self.serializer_class(data=request.data)
            if payload.is_valid():
                otp = payload.data.get("otp")
                user = User.objects.get(one_time_pin=otp)

                issued_at_time = user.one_time_pin_generated_at
                current_time = timezone.now()
                time_difference = current_time - issued_at_time
                logger.info(
                    f" time difference between issued at and now is {time_difference.total_seconds()} in seconds"
                )
                time_difference = divmod(time_difference.total_seconds(), 60)
                difference_in_minutes = time_difference[0]
                logger.info(
                    f" time difference between issued at and now is {difference_in_minutes} in minutes"
                )

                if difference_in_minutes > 10:
                    return ApiResponse(
                        num_status=400,
                        bool_status=False,
                        message="OTP Expired",
                    )

                # clear the one time pins
                user.one_time_pin = None
                user.one_time_pin_generated_at = None
                user.set_password(payload.data.get("password"))
                user.save()

                jwt_payload = generate_jwt_payload(user)

                access_token = jwt.encode(
                    payload=jwt_payload["access"],
                    key=config("JWT_SECRET"),
                    algorithm="HS256",
                )
                refresh_token = jwt.encode(
                    payload=jwt_payload["refresh"],
                    key=config("JWT_SECRET"),
                    algorithm="HS256",
                )

                # notify user of login activity
                details = get_client_details(request)
                notify_user_about_login_activity.delay(user, details)

                return ApiResponse(
                    data={
                        "access_token": access_token,
                        "refresh_token": refresh_token,
                        "user": UserModelSerializer(user).data,
                    },
                )
            else:
                logger.error(f" {payload.errors}")
                return ApiResponse(
                    num_status=400,
                    bool_status=False,
                    issues=payload.errors,
                )
        except User.DoesNotExist:
            logger.error(" User does not exist")
            return ApiResponse(num_status=404, bool_status=False)
        except PasswordUsedException as e:
            logger.error("password has been used before")
            return ApiResponse(num_status=400, bool_status=False, message=str(e))
        except Exception as e:
            logger.error(f" {e}")
            return ApiResponse(num_status=500, bool_status=False)


class UpdatePasswordView(APIView):
    parser_classes = (JSONParser,)
    renderer_classes = (JSONRenderer,)
    permission_classes = (IsAuthenticated,)
    serializer_class = UpdatePasswordPayloadSerializer

    def put(self, request):
        try:
            payload = self.serializer_class(data=request.data)
            if payload.is_valid():
                if request.user.check_password(
                    payload.validated_data.get("old_password")
                ):
                    request.user.set_password(payload.validated_data.get("password"))
                    request.user.save()

                    notify_user_that_their_password_has_been_updated.delay(request.user)

                    return ApiResponse()
                else:
                    logger.error("Incorrect current password")
                    return ApiResponse(
                        num_status=400,
                        bool_status=False,
                        message="Incorrect current password",
                    )
            else:
                logger.error(payload.errors)
                return ApiResponse(
                    num_status=400, bool_status=False, issues=payload.errors
                )
        except PasswordUsedException as exc:
            return ApiResponse(num_status=500, bool_status=False, message=exc.__str__())
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class PatientPreregistrationView(APIView):
    authentication_classes = ()
    serializer_class = PreregistrationPayloadSerializer

    @transaction.atomic()
    def post(self, request):
        try:
            payload = self.serializer_class(data=request.data)
            if payload.is_valid():
                logger.info("creating account for patient")
                user = User(
                    email=payload.validated_data.get("email"),
                    username=create_username(
                        first_name=payload.validated_data.get("first_name"),
                        last_name=payload.validated_data.get("last_name"),
                    ),
                    first_name=payload.validated_data.get("first_name"),
                    last_name=payload.validated_data.get("last_name"),
                    role=UserRoles.PATIENT,
                    gender=payload.validated_data.get("gender"),
                )
                user.set_password(payload.validated_data.get("password"))
                user.save()
                logger.success("user account created successfully")

                # create patient profile
                logger.info("creating patient profile")
                medical_record_number = generate_medical_record_number()
                patient = Patient(
                    user=user,
                    medical_record_number=medical_record_number,
                    mobile_number=payload.validated_data.get("mobile_number"),
                    date_of_birth=payload.validated_data.get("date_of_birth"),
                    marital_status=payload.validated_data.get("marital_status"),
                    national_id_number=payload.validated_data.get("national_id_number"),
                    address=payload.validated_data.get("address"),
                    employment_status=payload.validated_data.get("employment_status"),
                )
                patient.save()

                # welcome user and send verification code
                send_welcome_note_to_patient.delay(user)
                send_verification_code_to_user.delay(user)

                jwt_payload = generate_jwt_payload(user)

                access_token = jwt.encode(
                    payload=jwt_payload["access"],
                    key=config("JWT_SECRET"),
                    algorithm="HS256",
                )
                refresh_token = jwt.encode(
                    payload=jwt_payload["refresh"],
                    key=config("JWT_SECRET"),
                    algorithm="HS256",
                )

                return ApiResponse(
                    data={
                        "access_token": access_token,
                        "refresh_token": refresh_token,
                        "user": UserModelSerializer(user).data,
                    },
                )
            else:
                logger.error(payload.errors)
                return ApiResponse(
                    num_status=400, bool_status=False, issues=payload.errors
                )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class VerifyAccountView(APIView):
    renderer_classes = [JSONRenderer]
    parser_classes = [JSONParser]
    permission_classes = (IsAuthenticated,)
    serializer_class = AccountVerificationPayloadSerializer

    def get(self, request):
        try:
            if request.user.is_verified is True:
                return ApiResponse()

            send_verification_code_to_user.delay(request.user)
            return ApiResponse()

        except Exception as e:
            logger.error(f"[Auth]: {e}")
            return ApiResponse(
                num_status=500,
                bool_status=False,
            )

    def post(self, request):
        user = request.user
        try:
            payload = self.serializer_class(data=request.data)

            if payload.is_valid():
                otp = payload.validated_data.get("otp")

                if user.is_verified:
                    return ApiResponse()

                # Check if pin hasn't expired (time 5 minutes)
                issued_at_time = user.one_time_pin_generated_at
                current_time = timezone.now()
                time_difference = current_time - issued_at_time
                logger.info(
                    f"[Auth]: Time difference between issued at and now is {time_difference.total_seconds()} in seconds"
                )
                time_difference = divmod(time_difference.total_seconds(), 60)
                difference_in_minutes = time_difference[0]
                logger.info(
                    f"[Auth]: Time difference between issued at and now is {difference_in_minutes} in minutes"
                )

                if difference_in_minutes > 5:
                    send_verification_code_to_user.delay(request.user)
                    return ApiResponse(
                        num_status=400,
                        bool_status=False,
                        message="OTP Expired",
                    )

                if user.one_time_pin == otp:
                    user.is_verified = True
                    user.one_time_pin = None
                    user.one_time_pin_generated_at = None
                    user.save()

                    return ApiResponse(
                        data={"user": UserModelSerializer(user).data},
                    )
                else:
                    return ApiResponse(
                        num_status=400,
                        bool_status=False,
                        issues={"otp": "Invalid OTP"},
                    )
            else:
                return ApiResponse(
                    num_status=400,
                    bool_status=False,
                    issues=payload.errors,
                )

        except Exception as e:
            logger.error(f"[Auth]: {e}")
            return ApiResponse(
                num_status=500,
                bool_status=False,
            )
