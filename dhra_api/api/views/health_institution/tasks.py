from django.template.loader import render_to_string
from django_rq import job

from health_institution.models import HealthInstitution
from services.helpers.notifications import send_email_alt, send_email
from users.models import User


@job("health_institution")
def notify_health_institution_on_registration(
    health_institution: HealthInstitution, password: str
):
    html_content = render_to_string(
        "notification.html",
        {
            "message": f"Good day, {health_institution.name}.\n\nYou've been registered as a healthcare provider on"
            f" Utano EHR and an admin account with the following details has been registered for you:\n\n"
            f"Email: {health_institution.email}\nPassword: {password}",
            "email": health_institution.email,
        },
    )
    send_email_alt.delay(
        email=health_institution.email,
        html_content=html_content,
        email_subject="Utano EHR Registration",
    )


@job("health_institution")
def notify_employee_on_registration(user: User, password: str):
    html_content = render_to_string(
        "notification.html",
        {
            "message": f"Good day, {user.get_full_name()}.\n\nYou've been registered as a {user.role} on"
            f" Utano EHR and an account with the following details has been registered for you:\n\n"
            f"Email: {user.email}\nPassword: {password}",
            "email": user.email,
        },
    )
    send_email.delay(
        user=user, html_content=html_content, email_subject="Utano EHR Registration"
    )
