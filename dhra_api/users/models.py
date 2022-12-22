import json

from decouple import config
from django.contrib.auth.hashers import make_password, check_password
from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils import timezone
from django.utils.translation import gettext_lazy as _
from loguru import logger

from services.exceptions.passwords import PasswordUsedException
from services.helpers.generate_otp import random_otp
from users.managers import UserManager
from utano.model import EnumModel, SoftDeleteModel


class UserRoles(EnumModel):
    PATIENT = "PATIENT", _("PATIENT")
    DOCTOR = "DOCTOR", _("DOCTOR")
    ADMIN = "ADMIN", _("ADMIN")
    NURSE = "NURSE", _("NURSE")
    HEALTH_INSTITUTION = "HEALTH_INSTITUTION", _("HEALTH_INSTITUTION")
    LAB_TECHNICIAN = "LAB_TECHNICIAN", _("LAB_TECHNICIAN")


class User(SoftDeleteModel, AbstractUser):
    email = models.EmailField(unique=True)
    is_active = models.BooleanField(default=True)
    is_email_verified = models.BooleanField(default=False)
    username = models.CharField(blank=True, null=True, unique=False, max_length=15)
    role = models.CharField(
        choices=UserRoles.choices, max_length=50, blank=False, null=True, default=None
    )
    password_history = models.TextField(blank=True, null=True, editable=False)
    password_updated_at = models.DateTimeField(blank=True, null=True)
    receive_email_notifications = models.BooleanField(default=True)
    one_time_pin = models.CharField(max_length=4, blank=True, null=True)
    one_time_pin_generated_at = models.DateTimeField(blank=True, null=True)
    device_token = models.CharField(max_length=255, blank=True, null=True)

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["username", "first_name", "last_name"]

    objects = UserManager()

    def __str__(self):
        return f"{self.first_name} {self.last_name}"

    class Meta:
        ordering = ["-updated_at"]
        verbose_name = "User"
        verbose_name_plural = "Users"
        table_prefix = "user"

    def set_password(self, raw_password):
        try:
            if self.password_history is not None:
                password_history = json.loads(self.password_history)
            else:
                password_history = []
            for password_json in password_history:
                logger.info("PASSWORD_JSON: ", password_json)
                password_object = json.loads(password_json)
                logger.info("PASSWORD_OBJECT: ", password_object)

                if check_password(
                        password=raw_password,
                        encoded=password_object.get("password"),
                        setter=None,
                ):
                    raise PasswordUsedException(
                        f"This password was used before and was changed on: "
                        f"{password_object.get('changed_on')}"
                    )

            # Add previous password to history list
            logger.info("CHANGING PASSWORD RIGHT NOW: ", timezone.now())
            password_history.append(
                json.dumps(
                    {"password": self.password, "changed_on": str(timezone.now())}
                )
            )

            self.password_history = json.dumps(password_history)
            self.password = make_password(raw_password)
            self._password = raw_password
            self.password_updated_at = timezone.now()
        except Exception as e:
            logger.info("SETTING PASSWORD EXCEPTION: ", e)
            raise

    def save(self, *args, **kwargs):
        # set admin user permissions
        if self.is_superuser:
            self.role = UserRoles.ADMIN
            self.is_verified = True
        super().save(*args, **kwargs)

    def generate_one_time_pin(self):
        pin = random_otp()
        self.one_time_pin = pin
        self.one_time_pin_generated_at = timezone.now()
        self.save()