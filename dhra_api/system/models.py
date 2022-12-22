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
        table_prefix = "request"


class FrequentlyAskedQuestion(SoftDeleteModel):
    title = models.CharField(max_length=1000, blank=True, null=False, unique=True)
    answer = models.TextField(blank=True, null=False)

    class Meta:
        verbose_name = "Frequently Asked Question"
        verbose_name_plural = "Frequently Asked Questions"
        table_prefix = "faq"


class Gender(EnumModel):
    MALE = "MALE", _("MALE")
    FEMALE = "FEMALE", _("FEMALE")


class SystemStatus(EnumModel):
    PENDING = "PENDING", _("Pending")
    IN_PROGRESS = "IN_PROGRESS", _("In progress")
    COMPLETED = "COMPLETED", _("Completed")
    CANCELLED = "CANCELLED", _("Cancelled")
