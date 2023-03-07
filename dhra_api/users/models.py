import json

from django.contrib.auth.hashers import make_password, check_password
from django.contrib.auth.models import AbstractUser
from django.contrib.postgres.fields import ArrayField
from django.db import models
from django.utils import timezone
from django.utils.translation import gettext_lazy as _
from loguru import logger
from phonenumber_field.modelfields import PhoneNumberField

from services.exceptions.passwords import PasswordUsedException
from services.helpers.generate_otp import random_otp
from services.helpers.readable_date import readable_date_time_string
from system.models import Gender, MaritalStatus, EmploymentStatus
from users.managers import UserManager
from utano.model import EnumModel, SoftDeleteModel


class UserRoles(EnumModel):
    PATIENT = "PATIENT", _("PATIENT")
    DOCTOR = "DOCTOR", _("DOCTOR")
    SYSTEM_ADMIN = "SYSTEM_ADMIN", _("SYSTEM_ADMIN")
    ADMIN = "ADMIN", _("ADMIN")
    NURSE = "NURSE", _("NURSE")
    HEALTH_INSTITUTION = "HEALTH_INSTITUTION", _("HEALTH_INSTITUTION")
    LAB_TECHNICIAN = "LAB_TECHNICIAN", _("LAB_TECHNICIAN")
    PHARMACIST = "PHARMACIST", _("PHARMACIST")


class User(SoftDeleteModel, AbstractUser):
    email = models.EmailField(unique=True)
    is_active = models.BooleanField(default=True)
    is_verified = models.BooleanField(default=False)
    username = models.CharField(
        blank=False, null=False, unique=True, max_length=15, db_index=True
    )
    role = models.CharField(
        choices=UserRoles.choices, max_length=50, blank=False, null=False
    )
    gender = models.CharField(
        max_length=255,
        choices=Gender.choices,
        blank=True,
        null=True,
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
                logger.debug(f"password_json: {password_json}")
                password_object = json.loads(password_json)
                logger.debug(f"password_object: {password_object}")

                if check_password(
                    password=raw_password,
                    encoded=password_object.get("password"),
                    setter=None,
                ):
                    password_changed_on = password_object.get("changed_on")
                    password_changed_on_readable_date = readable_date_time_string(
                        date=password_changed_on
                    )
                    raise PasswordUsedException(
                        f"This password was used before and was changed on "
                        f"{password_changed_on_readable_date[0]} around {password_changed_on_readable_date[1]}."
                    )

            # Add previous password to history list
            logger.debug(f"changing password right now: {timezone.now()}")
            password_history.append(
                json.dumps(
                    {"password": self.password, "changed_on": str(timezone.now())}
                )
            )

            self.password_history = json.dumps(password_history)
            self.password = make_password(raw_password)
            self._password = raw_password
            self.password_updated_at = timezone.now()
        except Exception as exc:
            logger.error(f"exception setting password: {exc}")
            raise

    def save(self, *args, **kwargs):
        # set admin user permissions
        if self.is_superuser:
            self.role = UserRoles.SYSTEM_ADMIN
            self.is_verified = True
        super().save(*args, **kwargs)

    def generate_one_time_pin(self):
        pin = random_otp()
        self.one_time_pin = pin
        self.one_time_pin_generated_at = timezone.now()
        self.save()


class Patient(SoftDeleteModel):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="patient")
    medical_record_number = models.CharField(max_length=10, blank=False, null=False)
    date_of_birth = models.DateField(blank=True)
    place_of_birth = models.CharField(max_length=255, blank=True)
    national_id_number = models.CharField(
        max_length=255, blank=True, null=True, unique=True
    )
    address = models.CharField(max_length=255, blank=True)
    blood_type = models.CharField(max_length=255, blank=True)
    fitzpatrick_skin_type = models.CharField(max_length=255, blank=True)
    wheelchair = models.BooleanField(default=False)
    mobile_number = PhoneNumberField(unique=True, region="ZW")
    mother_name = models.CharField(max_length=255, blank=True)
    father_name = models.CharField(max_length=255, blank=True)
    marital_status = models.CharField(
        max_length=20,
        choices=MaritalStatus.choices,
        default=MaritalStatus.SINGLE,
        blank=True,
    )
    occupation = models.CharField(max_length=255, blank=True)
    height = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    weight = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    registered_at = models.ForeignKey(
        "health_institution.HealthInstitution",
        on_delete=models.DO_NOTHING,
        blank=True,
        null=True,
    )
    registered_on = models.DateTimeField(auto_now_add=True)
    employment_status = models.CharField(
        max_length=20, choices=EmploymentStatus.choices, blank=True, null=True
    )

    class Meta:
        ordering = ["-updated_at"]
        verbose_name = "Patient"
        verbose_name_plural = "Patients"
        table_prefix = "pt"

    @property
    def get_mobile_number(self):
        return f"0{self.mobile_number.national_number}"


class Employee(SoftDeleteModel):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="employee")
    registered_at = models.ForeignKey(
        "health_institution.HealthInstitution",
        on_delete=models.DO_NOTHING,
        related_name="employees",
    )
    professional_title = models.CharField(max_length=255, blank=True, null=True)
    bio = models.TextField(blank=True, null=True)
    tags = ArrayField(models.CharField(max_length=255), default=list, null=False)
    qualifications = ArrayField(
        models.CharField(max_length=255), default=list, null=False
    )
    registered_on = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ["-updated_at"]
        verbose_name = "Employee"
        verbose_name_plural = "Employees"
        table_prefix = "employee"

    def __str__(self):
        return f"{self.user.first_name} {self.user.last_name}"
