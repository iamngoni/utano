from django.db import models

from utano.model import SoftDeleteModel


class HealthInstitution(SoftDeleteModel):
    name = models.CharField(max_length=255, blank=False, null=False, unique=True)
    address = models.CharField(max_length=255, blank=False, null=False)
    phone_number = models.CharField(max_length=255, blank=False, null=False)
    email = models.EmailField(blank=False, null=False)
    logo = models.ImageField(upload_to="health_institutions", blank=True, null=True)
    district = models.ForeignKey(
        "system.District", blank=False, null=False, on_delete=models.DO_NOTHING
    )

    class Meta:
        ordering = ["-updated_at"]
        verbose_name = "Health Institution"
        verbose_name_plural = "Health Institutions"
        table_prefix = "hinst"
