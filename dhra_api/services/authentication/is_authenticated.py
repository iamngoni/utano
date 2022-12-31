import jwt
from django.utils.translation import gettext_lazy as _
from jwt import ExpiredSignatureError, DecodeError
from loguru import logger
from rest_framework import exceptions
from rest_framework.authentication import BaseAuthentication

from auth0.models import BlacklistToken
from users.models import User
from decouple import config


class IsAPIAuthenticated(BaseAuthentication):
    def _get_token(self, request):
        header = request.headers.get("Authorization")

        # Check if required authentication header is present
        if header is None:
            return None

        header_values = header.split(" ")

        if len(header_values) == 2:
            # Get the actual token from the header value
            token = header_values[1]
            logger.debug(f"Token: {token}")
            return token
        else:
            msg = _("WHO ARE YOU? LETS TALK LIKE ADULTS.")
            raise exceptions.AuthenticationFailed(msg)

    def authenticate(self, request):
        """

        @param request:
        @return:
        """
        # if request.data has items log them separately
        if request.data:
            # log each item in the request.data
            for key, value in request.data.items():
                logger.info(f"{key}: {value}")

        # Get the actual token from the header value
        token = self._get_token(request)

        if token is None:
            msg = _("WHO ARE YOU? LETS TALK LIKE ADULTS.")
            raise exceptions.AuthenticationFailed(msg)

        # Check if token is blacklisted / destroyed
        try:
            token_in_blacklist = BlacklistToken.objects.get(token=token)
            if token_in_blacklist is not None:
                msg = _("Invalid Token [User logged out already]")
                raise exceptions.AuthenticationFailed(msg)
        except BlacklistToken.DoesNotExist:
            pass

        try:
            # Decode token
            decoded = jwt.decode(
                token,
                options={"require": ["exp", "iat", "iss"]},
                key=config("JWT_SECRET"),
                verify=True,
                algorithms=["HS256"],
            )

            if decoded.get("type") != "access":
                msg = _("Invalid Token Type")
                raise exceptions.AuthenticationFailed(msg)

            pk = decoded.get("id")
            user = User.objects.get(id=pk)
            logger.debug(f"[IsAuthenticated]: {user}")

            return user, token
        except User.DoesNotExist:
            msg = _("Token doesn't represent any user.")
            raise exceptions.AuthenticationFailed(msg)
        except ExpiredSignatureError as e:
            logger.error(e)
            msg = _("Session expired. Please login again.")
            raise exceptions.AuthenticationFailed(msg)
        except DecodeError as e:
            logger.error(e)
            msg = _("Token Decoding Failure")
            raise exceptions.AuthenticationFailed(msg)
