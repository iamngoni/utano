#
#  tasks.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from django_rq import job
from loguru import logger

from pos.models import Prescription
from services.helpers.notifications import send_sms_text


@job("pos")
def send_prescription_to_patient(prescription: Prescription):
    try:
        prescription_email_message = ""
        prescription_text_message = ""

        # todo: send email
        send_sms_text.delay(
            prescription.patient.get_mobile_number, prescription_text_message
        )
    except Exception as exc:
        logger.error(exc)
        raise
