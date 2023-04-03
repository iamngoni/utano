from django.contrib import admin

from pos.models import PatientCheckIn, Prescription, PrescriptionItem


@admin.register(PatientCheckIn, Prescription, PrescriptionItem)
class UniversalAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in self.model._meta.concrete_fields]
