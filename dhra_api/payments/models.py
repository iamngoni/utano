from django.db import models

from system.models import PaymentMethod, SystemStatus
from utano.model import SoftDeleteModel


class Payment(SoftDeleteModel):
    amount = models.FloatField(default=0, blank=False, null=False)
    rtgs_amount = models.FloatField(default=0, blank=False, null=False)
    description = models.TextField(max_length=1000, blank=True, null=False)
    paid = models.BooleanField(default=False, blank=False, null=False)
    status = models.CharField(
        max_length=100, choices=SystemStatus.choices, default=SystemStatus.PENDING
    )
    payment_method = models.CharField(
        max_length=255, choices=PaymentMethod.choices, default=PaymentMethod.ECOCASH
    )
    provider_response = models.TextField(max_length=10000, blank=True, null=True)
    payment_option_info_1 = models.TextField(max_length=10000, blank=True, null=True)
    payment_option_info_2 = models.TextField(max_length=10000, blank=True, null=True)
    payment_option_info_3 = models.TextField(max_length=10000, blank=True, null=True)
    payment_option_info_4 = models.TextField(max_length=10000, blank=True, null=True)
    payment_option_info_5 = models.TextField(max_length=10000, blank=True, null=True)
    payment_link = models.URLField(blank=True, null=True)

    class Meta:
        verbose_name = "Payment"
        verbose_name_plural = "Payments"
        table_prefix = "pay"

    def __str__(self):
        return f"{self.payment_method} - ${self.amount} - ${self.rtgs_amount}"
