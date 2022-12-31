from django.db import models

from utano.model import SoftDeleteModel


class BlacklistToken(SoftDeleteModel):
    token = models.CharField(
        null=False, blank=False, max_length=1000, unique=True, db_index=True
    )

    class Meta:
        verbose_name = "BlacklistToken"
        verbose_name_plural = "BlacklistTokens"
        table_prefix = "tk"

    def __str__(self):
        return f"{self.id}"
