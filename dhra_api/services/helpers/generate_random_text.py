import random
import string


def generate_random_text(char_range: int = 35) -> str:
    characters = string.ascii_letters + string.digits
    random_text = "".join(random.choice(characters) for _ in range(char_range))
    return random_text
