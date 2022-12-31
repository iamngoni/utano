from django.contrib import admin

from system.models import ApiRequest, District, Province


@admin.register(ApiRequest, Province, District)
class UniversalAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in self.model._meta.concrete_fields]
