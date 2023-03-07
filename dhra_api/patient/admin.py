from django.contrib import admin

from patient.models import EmergencyContact


@admin.register(EmergencyContact)
class UniversalAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in self.model._meta.concrete_fields]
