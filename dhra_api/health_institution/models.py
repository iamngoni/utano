from django.db import models

from utano.model import SoftDeleteModel


class HealthInstitution(SoftDeleteModel):
    name = models.CharField(
        max_length=255, blank=False, null=False, unique=True, db_index=True
    )
    address = models.CharField(max_length=255, blank=False, null=False)
    phone_number = models.CharField(
        max_length=255, blank=False, null=False, unique=True
    )
    email = models.EmailField(blank=False, null=False, unique=True)
    logo = models.ImageField(upload_to="health_institutions", blank=True, null=True)
    district = models.ForeignKey(
        "system.District", blank=False, null=False, on_delete=models.DO_NOTHING
    )
    is_active = models.BooleanField(default=True)

    class Meta:
        ordering = ["-updated_at"]
        verbose_name = "Health Institution"
        verbose_name_plural = "Health Institutions"
        table_prefix = "inst"


class Client(SoftDeleteModel):
    details = models.CharField(max_length=255, blank=False, null=False)
    health_institution = models.ForeignKey(
        "health_institution.HealthInstitution",
        blank=False,
        null=False,
        on_delete=models.DO_NOTHING,
    )

    class Meta:
        verbose_name = "Client"
        verbose_name_plural = "Clients"
        table_prefix = "cli"

    def __str__(self):
        return f"{self.health_institution.name} | {self.details}"
