from django.contrib import admin

from users.models import HealthInstitution, User, Patient, Nurse, LabTechnician, Doctor


@admin.register(
    User,
    HealthInstitution,
    Patient,
    Doctor,
    Nurse,
    LabTechnician,
)
class UniversalAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in self.model._meta.concrete_fields]
