from django.db import models

from utano.model import SoftDeleteModel


class Drug(SoftDeleteModel):
    name = models.CharField(max_length=255, blank=False, null=False, unique=True)
    description = models.TextField(blank=True, null=True)
    price = models.DecimalField(
        max_digits=10, decimal_places=2, blank=False, null=False
    )
    quantity = models.IntegerField(blank=False, null=False)
    is_active = models.BooleanField(default=True)
    is_in_stock = models.BooleanField(default=False)

    class Meta:
        verbose_name = "Drug"
        verbose_name_plural = "Drugs"
        table_prefix = "drug"


class Order(SoftDeleteModel):
    prescription = models.ForeignKey(
        "pos.Prescription",
        related_name="orders",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )

    class Meta:
        verbose_name = "Order"
        verbose_name_plural = "Orders"
        table_prefix = "order"
