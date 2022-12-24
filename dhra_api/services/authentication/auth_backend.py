from django.contrib.auth.backends import ModelBackend
from django.contrib.auth import get_user_model
from django.db.models import Q

from users.models import User
from loguru import logger


class AuthModelBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            logger.info(f"using username: {username}")
            user_model = get_user_model()
            logger.info(f"user model: {user_model}")
            logger.info(f"model username field: {user_model.USERNAME_FIELD}")
            users = user_model._default_manager.filter(
                Q(username__iexact=username) | Q(email__iexact=username)
            )
            logger.info(f"Users: {users}")

            for user in users:
                if user.check_password(password):
                    return user

            if not users:
                user_model().set_password(password)

        except User.DoesNotExist:
            return None
