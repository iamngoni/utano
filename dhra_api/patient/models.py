from django.db import models
from phonenumber_field.modelfields import PhoneNumberField

from system.models import RelationshipType
from utano.model import SoftDeleteModel


class EmergencyContact(SoftDeleteModel):
    patient = models.ForeignKey(
        "users.Patient",
        related_name="contacts",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )
    first_name = models.CharField(max_length=255, blank=False, null=False)
    last_name = models.CharField(max_length=255, blank=False, null=False)
    mobile_number = PhoneNumberField(unique=False, region="ZW")
    address = models.TextField(blank=True, null=True)
    relationship = models.CharField(
        max_length=20, choices=RelationshipType.choices, blank=False, null=False
    )

    class Meta:
        verbose_name = "Emergency Contact"
        verbose_name_plural = "Emergency Contacts"
        table_prefix = "emc"


class Insurance(SoftDeleteModel):
    patient = models.ForeignKey(
        "users.Patient",
        related_name="insurances",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )

    class Meta:
        verbose_name = "Insurance"
        verbose_name_plural = "Insurances"
        table_prefix = "ins"


class Allergy(SoftDeleteModel):
    patient = models.ForeignKey(
        "users.Patient",
        related_name="allergies",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )

    class Meta:
        verbose_name = "Allergy"
        verbose_name_plural = "Allergies"
        table_prefix = "allergy"
