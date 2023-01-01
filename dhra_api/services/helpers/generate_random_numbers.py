import random
import string


def generate_random_numbers(n: int = 15) -> str:
    characters = string.digits
    random_numbers = "".join(random.choice(characters) for _ in range(n))
    return random_numbers
