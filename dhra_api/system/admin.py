from django.contrib import admin

from auth0.models import BlacklistToken
from system.models import ApiRequest


@admin.register(
    ApiRequest,
)
class UniversalAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in self.model._meta.concrete_fields]
