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
    temperature = models.FloatField(blank=False, null=False)
    systolic_blood_pressure = models.FloatField(blank=False, null=False)
    diastolic_blood_pressure = models.FloatField(blank=False, null=False)
    pulse = models.FloatField(blank=False, null=False)
    respiratory_rate = models.FloatField(blank=True, null=True)
    patient_notes = models.TextField(blank=False, null=False)
    examination_notes = models.TextField(blank=False, null=False)
    diagnosis_notes = models.TextField(blank=False, null=False)
    treatment_notes = models.TextField(blank=False, null=False)
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
    height = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    weight = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)

    class Meta:
        verbose_name = "Patient Check-In"
        verbose_name_plural = "Patient Check-Ins"
        table_prefix = "checkin"

    @property
    def patient(self) -> Union[None, Patient]:
        return Patient.objects.filter(mobile_number=self.mobile_number).first()

    @property
    def get_mobile_number(self):
        return f"0{self.mobile_number.national_number}"

    @property
    def blood_pressure(self):
        return f"{self.systolic_blood_pressure}/{self.diastolic_blood_pressure} mmHg"


class Prescription(SoftDeleteModel):
    patient = models.ForeignKey(
        "users.Patient",
        related_name="prescriptions",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )
    check_in = models.OneToOneField(
        "pos.PatientCheckIn",
        related_name="prescription",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )
    prepared_at = models.ForeignKey(
        "health_institution.HealthInstitution",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )
    prescription_number = models.CharField(
        max_length=20, blank=False, null=False, unique=True
    )
    prepared_by = models.ForeignKey(
        "users.Employee", on_delete=models.CASCADE, blank=False, null=False
    )
    notes = models.TextField(blank=False, null=False)

    class Meta:
        verbose_name = "Prescription"
        verbose_name_plural = "Prescriptions"
        table_prefix = "pres"


class PrescriptionItem(SoftDeleteModel):
    prescription = models.ForeignKey(
        "pos.Prescription",
        related_name="items",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )
    medicine = models.CharField(max_length=255, blank=False, null=False)
    medicine_id = models.CharField(max_length=255, blank=True, null=True)
    quantity = models.IntegerField(blank=False, null=False)
    frequency = models.IntegerField(blank=False, null=False)
    instructions = models.TextField(blank=False, null=False)

    class Meta:
        verbose_name = "Prescription Item"
        verbose_name_plural = "Prescription Items"
        table_prefix = "pres-item"
