from typing import Union

from django.db import models
from phonenumber_field.modelfields import PhoneNumberField

from system.models import CheckInStatus, Gender
from users.models import Patient
from utano.model import SoftDeleteModel


class PatientCheckIn(SoftDeleteModel):
    first_name = models.CharField(max_length=255, blank=False, null=False)
    last_name = models.CharField(max_length=255, blank=False, null=False)
    date_of_birth = models.DateField(blank=False, null=False)
    address = models.TextField(blank=False, null=False)
    mobile_number = PhoneNumberField(region="ZW")
    gender = models.CharField(
        max_length=20, choices=Gender.choices, blank=False, null=False
    )
    status = models.CharField(
        max_length=20,
        choices=CheckInStatus.choices,
        default=CheckInStatus.CHECKED_IN,
        blank=False,
        null=False,
    )
    health_institution = models.ForeignKey(
        "health_institution.HealthInstitution",
        related_name="check_ins",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )

    class Meta:
        verbose_name = "Patient Check-In"
        verbose_name_plural = "Patient Check-Ins"
        table_prefix = "p-in"

    @property
    def patient(self) -> Union[None, Patient]:
        return Patient.objects.filter(mobile_number=self.mobile_number).first()

    @property
    def get_mobile_number(self):
        return f"0{self.mobile_number.national_number}"


class Prescription(SoftDeleteModel):
    patient = models.ForeignKey(
        "users.Patient",
        related_name="prescriptions",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )
