#
#  paynow_service.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 26/4/2023.
#  Copyright (c) 2023 ModestNerds, Co
from loguru import logger
from paynow import Paynow

from payments.models import Payment
from pharmacy.models import Dispense
from system.models import PaymentMethod

paynow = Paynow(
    integration_id="8379",
    integration_key="a671ff85-94dc-4613-93f2-9d3de0f5d5ff",
    result_url="https://google.com",
    return_url="https://google.com",
)


class PaynowService:
    """
    This class is responsible for handling all paynow related transactions
    This can be initialized with a payment object
    """

    def __init__(self, payment: Payment):
        self.payment = payment
        logger.info("Paynow service initialized")

    def process_dispensary_payment(self, dispense: Dispense) -> bool:
        """
        This method creates a payment on paynow
        :return:
        """

        if self.payment.payment_method not in [
            PaymentMethod.ECOCASH,
            PaymentMethod.ONEMONEY,
        ]:
            logger.info("Payment method not supported for paynow")
            return True

        payment = paynow.create_payment(
            reference=self.payment.id,
            auth_email=self.payment.patient_email
            if self.payment.patient_email
            else "h180202m@hit.ac.zw",
        )
        logger.info("Payment created on paynow")

        payment.add(
            f"Dispensary Payment: {dispense.id}",
            dispense.total_rtgs_cost,
        )
        logger.info("Payment item added to paynow")

        response = paynow.send_mobile(
            payment, self.payment.patient_phone, self.payment.payment_method.lower()
        )

        if response.success:
            logger.info("Payment created successfully")
            logger.info(vars(response))
            self.payment.provider_response = str(vars(response))
            self.payment.payment_option_info_1 = response.poll_url
            self.payment.payment_option_info_2 = response.instruction
            self.payment.payment_link = response.poll_url
            self.payment.save()
            return True
        else:
            logger.error("Payment creation failed")
            logger.error(response)
            # print all attribute of response
            logger.error(vars(response))
            self.payment.provider_response = str(response)
            self.payment.save()
            return False
