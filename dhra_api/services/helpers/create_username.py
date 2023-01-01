from loguru import logger

from services.helpers.generate_random_numbers import generate_random_numbers
from users.models import User


def create_username(first_name: str, last_name: str, exists: bool = False):
    random_text = generate_random_numbers()

    if exists:
        username = f"{first_name[:1]}{last_name}_{random_text}"[:10]
    else:
        username = f"{first_name[:1]}{last_name}"

    logger.info(f"generated username: {username}")

    # check if username already exists
    # if it does, generate a new one
    # if it doesn't, return the username
    if User.objects.filter(username=username).exists():
        logger.error(f"{username} exists. generating a new one")
        return create_username(first_name, last_name, exists=True)
    else:
        logger.success(f"{username} successfully generated")
        return username.lower()
