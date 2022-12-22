import math

import pyotp
import random
from loguru import logger


def generate_otp(shared_secret: str, length: int = 6) -> str:
    try:
        logger.debug("shared_secret", shared_secret)
        totp = pyotp.TOTP(shared_secret, interval=150, digits=length)
        otp = totp.now()
        logger.debug("GENERATED OTP IN GENERATE OTP: ", otp)
        return otp
    except Exception as e:
        logger.debug("Exception in generate_otp: ", e)
        raise


def random_otp() -> str:
    digits = "0123456789"
    otp = ""

    for i in range(4):
        otp += digits[math.floor(random.random() * 10)]

    logger.debug(f"Generated OTP -> {otp}")
    return otp
