from django.db import models

from utano.model import SoftDeleteModel


class ApprovedMedicine(SoftDeleteModel):
    name = models.CharField(max_length=255, unique=True)
    description = models.TextField()

    class Meta:
        verbose_name = "Approved Medicine"
        verbose_name_plural = "Approved Medicines"
        table_prefix = "medicine"

    def __str__(self):
        return self.name


class Drug(SoftDeleteModel):
    name = models.CharField(max_length=255, blank=False, null=False, unique=True)
    description = models.TextField(blank=True, null=True)
    price = models.DecimalField(
        max_digits=10, decimal_places=2, blank=False, null=False
    )
    quantity = models.IntegerField(blank=False, null=False)
    is_active = models.BooleanField(default=True)

    class Meta:
        verbose_name = "Drug"
        verbose_name_plural = "Drugs"
        table_prefix = "drug"
        ordering = ("-updated_at",)


class DrugHistory(SoftDeleteModel):
    drug = models.ForeignKey(
        Drug,
        related_name="history",
        on_delete=models.DO_NOTHING,
        blank=False,
        null=False,
    )
    description = models.TextField(blank=True, null=True)

    class Meta:
        verbose_name = "Drug History"
        verbose_name_plural = "Drugs History"
        table_prefix = "dg_hist"
        ordering = ("-updated_at",)


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
