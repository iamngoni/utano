from django.contrib import admin

from payments.models import Payment


@admin.register(Payment)
class UniversalAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in self.model._meta.concrete_fields]
