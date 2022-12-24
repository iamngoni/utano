from health_institution.models import HealthInstitution
from django.contrib import admin


@admin.register(
    HealthInstitution,
)
class UniversalAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in self.model._meta.concrete_fields]
