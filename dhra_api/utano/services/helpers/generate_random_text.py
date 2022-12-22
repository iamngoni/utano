import random
import string


def generate_random_text() -> str:
    characters = string.ascii_letters + string.digits
    random_text = "".join(random.choice(characters) for _ in range(35))
    return random_text
