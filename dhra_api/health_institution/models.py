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


class HealthInstitutionRoom(SoftDeleteModel):
    health_institution = models.ForeignKey(
        "health_institution.HealthInstitution",
        related_name="rooms",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )
    room_number = models.CharField(max_length=6, blank=False, null=False)

    class Meta:
        verbose_name = "Room"
        verbose_name_plural = "Rooms"
        table_prefix = "room"
