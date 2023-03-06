from django.template.loader import render_to_string
from django_rq import job

from health_institution.models import HealthInstitution
from services.helpers.notifications import send_email_alt


@job("health_institutions")
def notify_health_institution_on_registration(health_institution: HealthInstitution, password: str):
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
        email=health_institution.email, html_content=html_content, email_subject="Utano EHR Registration"
    )
