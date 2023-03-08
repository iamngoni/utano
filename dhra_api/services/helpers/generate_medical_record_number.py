#
#  generate_medical_record_number.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from loguru import logger

from services.helpers.generate_random_numbers import generate_random_numbers
from users.models import Patient


def generate_medical_record_number():
    mrn_inner = generate_random_numbers(n=5)
    mrn = f"UTANO{mrn_inner}"
    logger.info("Checking if mrn  exists")
    try:
        patient = Patient.objects.get(medical_record_number=mrn)
        if patient:
            logger.error("patient already exists. trying again!")
            return generate_medical_record_number()
    except Exception as exc:
        logger.debug(exc)
        logger.info(f"looks okay 👌. MRN: {mrn} does not exist. Using this one.")
        return mrn
