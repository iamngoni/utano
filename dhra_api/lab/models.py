from django.db import models

from system.models import SystemStatus
from utano.model import SoftDeleteModel


class TestRequest(SoftDeleteModel):
    patient = models.ForeignKey(
        "users.Patient",
        related_name="test_requests",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )
    tests = models.TextField(max_length=10000, blank=False, null=False)
    request_notes = models.TextField(max_length=1000, blank=False, null=False)
    lab_notes = models.TextField(max_length=1000, blank=True, null=False)
    status = models.CharField(
        max_length=255,
        choices=SystemStatus.choices,
        default=SystemStatus.PENDING,
        blank=False,
        null=False,
    )
    health_institution = models.ForeignKey(
        "health_institution.HealthInstitution",
        related_name="test_requests",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )
    scheduled_date = models.DateTimeField(blank=False, null=True)

    class Meta:
        verbose_name = "Test Request"
        verbose_name_plural = "Test Requests"
        table_prefix = "test_req"
        ordering = ("-updated_at",)

    def __str__(self):
        return f"{self.patient.__str__()} - {self.id}"


class TestDefinition(SoftDeleteModel):
    name = models.CharField(max_length=255, blank=False, null=False)
    description = models.CharField(max_length=500, blank=False, null=False)
    cost = models.FloatField(default=0, blank=False, null=False)
    rtgs_cost = models.FloatField(default=0, blank=False, null=False)

    class Meta:
        verbose_name = "Test Definition"
        verbose_name_plural = "Test Definitions"
        table_prefix = "test"
        ordering = ("-updated_at",)

    def __str__(self):
        return f"{self.name} - ${self.cost} - RTGS{self.rtgs_cost}"


class LabTest(SoftDeleteModel):
    patient = models.ForeignKey(
        "users.Patient",
        related_name="lab_tests",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )
    lab_tech = models.ForeignKey(
        "users.Employee",
        related_name="labs",
        on_delete=models.DO_NOTHING,
        blank=False,
        null=False,
    )
    test = models.ForeignKey(
        TestDefinition,
        related_name="lab_tests",
        on_delete=models.DO_NOTHING,
        blank=False,
        null=False,
    )
    status = models.CharField(
        max_length=15,
        choices=SystemStatus.choices,
        default=SystemStatus.PENDING,
        blank=False,
        null=False,
    )
    results = models.TextField(max_length=10000, blank=True, null=False)
    payment = models.ForeignKey(
        "payments.Payment",
        related_name="tests",
        on_delete=models.DO_NOTHING,
        blank=False,
        null=True,
    )

    class Meta:
        verbose_name = "Lab Test"
        verbose_name_plural = "Lab Tests"
        table_prefix = "lab"
        ordering = ("-updated_at",)

    def __str__(self):
        return f"{self.test.name} - {self.patient.user.get_full_name()}"
