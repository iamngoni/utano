import datetime

from django.utils import timezone

from users.models import User


def generate_jwt_payload(user: User) -> dict:
    payload = {
        "access": {
            "type": "access",
            "id": str(user.id),
            "iat": timezone.now(),
            "exp": timezone.now() + datetime.timedelta(days=1),
            "iss": "Ngonidzashe Mangudya (H180202M)",
        },
        "refresh": {
            "type": "refresh",
            "id": str(user.id),
            "iat": timezone.now(),
            "exp": timezone.now() + datetime.timedelta(days=30),
            "iss": "Ngonidzashe Mangudya (H180202M)",
        },
    }

    return payload
