import random
import string


def generate_random_password() -> str:
    characters = string.ascii_letters + string.digits + string.punctuation
    password = "".join(random.choice(characters) for i in range(8))
    return password
