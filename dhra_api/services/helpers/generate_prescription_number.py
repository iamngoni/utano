#
#  generate_prescription_number.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 8/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from loguru import logger

from pos.models import Prescription
from services.helpers.generate_random_numbers import generate_random_numbers


def generate_prescription_number():
    prescription_number = generate_random_numbers(n=4)
    prescription_number = f"UTANO{prescription_number}"
    logger.info("Checking if mrn  exists")
    try:
        prescription = Prescription.objects.get(prescription_number=prescription_number)
        if prescription:
            logger.error("prescription already exists. trying again!")
            return generate_prescription_number()
    except Exception as exc:
        logger.debug(exc)
        logger.info(
            f"looks okay 👌. prescription number: {prescription_number} does not exist. Using this one."
        )
        return prescription_number
