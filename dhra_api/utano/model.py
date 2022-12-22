from django.core import serializers
from django.db import models
from django.utils import timezone

from services.helpers.create_row_id import create_row_id

import django.db.models.options as options

options.DEFAULT_NAMES = options.DEFAULT_NAMES + ("table_prefix",)


class SoftDeleteManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(deleted_at__isnull=True)


class SoftDeleteModel(models.Model):
    id = models.CharField(primary_key=True, editable=False, max_length=35)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    deleted_at = models.DateTimeField(null=True, default=None, blank=True)
    objects = SoftDeleteManager()
    all_objects = models.Manager()

    def soft_delete(self):
        self.deleted_at = timezone.now()
        self.save()

    def restore(self):
        self.deleted_at = None
        self.save()

    def to_json(self):
        return serializers.serialize(
            "json",
            [
                self,
            ],
        )

    class Meta:
        abstract = True
        ordering = ("-updated_at",)

    def save(self, *args, **kwargs):
        if not self.id:
            table_name = self._meta.db_table
            self.id = create_row_id(table_name=table_name)

        return super(SoftDeleteModel, self).save(*args, **kwargs)

    @classmethod
    def get_item_by_id(cls, pk):
        return cls.objects.filter(id=pk).first()


class EnumModel(models.TextChoices):
    @classmethod
    def get_list_of_options(cls):
        return list(map(lambda choice: choice[0], cls.choices))

    @classmethod
    def get_mapped_list_of_choices(cls):
        return list(
            map(
                lambda option: {"description": option[1], "value": option[0]},
                cls.choices,
            )
        )
