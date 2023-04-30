from decouple import config
from django.db import models
from django.utils.translation import gettext_lazy as _

from utano.model import SoftDeleteModel, EnumModel


class ApprovedMedicine(SoftDeleteModel):
    name = models.CharField(max_length=255, unique=True)
    description = models.TextField()
    indication = models.TextField(blank=True, null=False)
    contraindication = models.TextField(blank=True, null=False)
    dosage = models.TextField(blank=True, null=False)
    interactions = models.TextField(blank=True, null=False)

    class Meta:
        verbose_name = "Approved Medicine"
        verbose_name_plural = "Approved Medicines"
        table_prefix = "medicine"
        ordering = ("name",)

    def __str__(self):
        return self.name


class DrugForm(EnumModel):
    TABLET = "tablet", _("Tablet")
    CAPSULE = "capsule", _("Capsule")
    LIQUID = "liquid", _("Liquid")
    PASTE = "paste", _("Paste")
    OTHER = "other", _("Other")


class Drug(SoftDeleteModel):
    name = models.CharField(max_length=255, blank=False, null=False)
    description = models.TextField(blank=True, null=True)
    price = models.DecimalField(
        max_digits=10, decimal_places=2, blank=False, null=False
    )
    quantity = models.IntegerField(blank=False, null=False)
    form = models.CharField(
        max_length=255,
        choices=DrugForm.choices,
        default=DrugForm.TABLET,
        blank=False,
        null=False,
    )
    health_institution = models.ForeignKey(
        "health_institution.HealthInstitution",
        related_name="drugs",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )
    is_active = models.BooleanField(default=True)

    class Meta:
        verbose_name = "Drug"
        verbose_name_plural = "Drugs"
        table_prefix = "drug"
        ordering = ("name",)

    def __str__(self):
        return self.name

    @property
    def medicine(self):
        return ApprovedMedicine.objects.filter(name=self.name).first()


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

    def __str__(self):
        return self.drug.name


class Dispense(SoftDeleteModel):
    prescription = models.ForeignKey(
        "pos.Prescription",
        related_name="dispenses",
        on_delete=models.CASCADE,
        blank=False,
        null=True,
    )
    payment = models.ForeignKey(
        "payments.Payment",
        related_name="dispenses",
        on_delete=models.CASCADE,
        blank=False,
        null=True,
    )

    class Meta:
        verbose_name = "Dispense"
        verbose_name_plural = "Dispenses"
        table_prefix = "dispense"

    @property
    def total_cost(self) -> float:
        total_cost = 0
        for item in self.items.all():
            total_cost += item.cost

        return float(total_cost)

    @property
    def total_rtgs_cost(self) -> float:
        return float(self.total_cost) * config("RTGS_RATE", cast=float, default=1)


class DispenseItem(SoftDeleteModel):
    dispense = models.ForeignKey(
        Dispense,
        related_name="items",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )
    drug = models.ForeignKey(
        Drug,
        related_name="dispenses",
        on_delete=models.CASCADE,
        blank=False,
        null=False,
    )
    quantity = models.IntegerField(blank=False, null=False)

    class Meta:
        verbose_name = "Dispense Item"
        verbose_name_plural = "Dispense Items"
        table_prefix = "dispense_item"

    def __str__(self):
        return self.drug.name

    @property
    def cost(self):
        return self.drug.price * self.quantity
