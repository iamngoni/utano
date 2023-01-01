from django.contrib import admin

from users.models import User, Patient, Employee


@admin.register(User, Patient, Employee)
class UniversalAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in self.model._meta.concrete_fields]
