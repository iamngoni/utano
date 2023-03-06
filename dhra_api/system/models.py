from django.db import models

from django.utils.translation import gettext_lazy as _

from utano.model import SoftDeleteModel, EnumModel


class ApiRequest(SoftDeleteModel):
    method = models.CharField(max_length=6, default="GET", blank=True, null=True)
    path = models.CharField(max_length=255, blank=True, null=True)
    headers = models.TextField(null=True, blank=True)

    class Meta:
        verbose_name = "API Request"
        verbose_name_plural = "API Requests"
        table_prefix = "req"


class Gender(EnumModel):
    MALE = "MALE", _("MALE")
    FEMALE = "FEMALE", _("FEMALE")


class SystemStatus(EnumModel):
    PENDING = "PENDING", _("Pending")
    IN_PROGRESS = "IN_PROGRESS", _("In progress")
    COMPLETED = "COMPLETED", _("Completed")
    CANCELLED = "CANCELLED", _("Cancelled")


class Province(SoftDeleteModel):
    name = models.CharField(
        max_length=255, blank=False, null=False, unique=True, db_index=True
    )

    class Meta:
        verbose_name = "Province"
        verbose_name_plural = "Provinces"
        table_prefix = "prov"
        ordering = ["name"]

    def __str__(self):
        return self.name


class District(SoftDeleteModel):
    name = models.CharField(
        max_length=255, blank=False, null=False, unique=True, db_index=True
    )
    province = models.ForeignKey(
        "system.Province",
        related_name="districts",
        blank=False,
        null=False,
        on_delete=models.CASCADE,
        db_index=True,
    )

    class Meta:
        verbose_name = "District"
        verbose_name_plural = "Districts"
        table_prefix = "distr"
        ordering = ["name"]

    def __str__(self):
        return self.name
