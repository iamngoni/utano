from django.contrib import admin

from lab.models import TestDefinition, LabTest, TestRequest


@admin.register(TestDefinition, LabTest, TestRequest)
class UniversalAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in self.model._meta.concrete_fields]
