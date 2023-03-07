from django.db import models
from phonenumber_field.modelfields import PhoneNumberField

from utano.model import SoftDeleteModel


class EmergencyContact(SoftDeleteModel):
    patient = models.ForeignKey(
        "users.Patient", on_delete=models.CASCADE, blank=False, null=False
    )
    first_name = models.CharField(max_length=255, blank=False, null=False)
    last_name = models.CharField(max_length=255, blank=False, null=False)
    mobile_number = PhoneNumberField(unique=False, region="ZW")
    address = models.TextField(blank=True, null=True)
    relationship = models.CharField(max_length=20, blank=False, null=False)
