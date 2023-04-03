from django.contrib import admin

from pharmacy.models import Order, Drug, ApprovedMedicine


@admin.register(ApprovedMedicine, Drug, Order)
class UniversalAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in self.model._meta.concrete_fields]
