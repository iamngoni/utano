from datetime import datetime

from django.utils import timezone

from services.helpers.notifications import send_email, send_email_alt, send_sms_text
from services.helpers.readable_date import readable_date
from users.models import User
from django_rq import job
from decouple import config
import ipinfo
from loguru import logger
from django.template.loader import render_to_string


@job("auth")
def notify_user_about_login_activity(user: User, details):
    """
    notify user about the login activity on their account i.e.
    inform them about the location, client used, ip address,
    date & time when the login activity occurred
    """
    signed_in_at = timezone.now()

    # Get approximate location from ip
    try:
        token = config("IPINFO_TOKEN")
        handler = ipinfo.getHandler(token)
        data = handler.getDetails(ip_address=details.get("ip"))
        location = f"{data.city}, {data.region}, {data.country_name}"
        logger.info(f"[Job]: Location: {location}")
    except Exception as e:
        logger.error(f"[Job]: Failed to get location: {e}")
        location = "Unknown"

    # Send email to user
    html_content = render_to_string(
        "login_activity.html",
        {
            "email": user.email,
            "location": location,
            "client": details.get("user_agent"),
            "ip": details.get("ip"),
            "time": signed_in_at,
        },
    )

    send_email.delay(user=user, html_content=html_content)
    logger.info(f"[Job]: Task Executed!")


@job("auth")
def send_welcome_note_to_patient(user: User):
    """
    send a welcome message to the user as well as a
    verification code that they can use to verify their email
    address if they didn't use social authentication
    """
    # generate one time pin
    user.generate_one_time_pin()

    # Send email to user
    html_content = render_to_string(
        "notification.html",
        {
            "message": f"Hi {user.get_full_name()}, we're glad to have you as part of this great digital migration "
            f"towards better healthcare services.",
            "email": user.email,
        },
    )

    send_email.delay(user=user, html_content=html_content)

    text_message = (
        f"Hi {user.get_full_name()}, we're glad to have you as part of this great digital migration "
        f"towards better healthcare services."
    )
    send_sms_text.delay(user.patient.get_mobile_number, text_message)


@job("auth")
def send_verification_code_to_user(user: User):
    """
    send a welcome message to the user as well as a
    verification code that they can use to verify their email
    address if they didn't use social authentication
    """
    # generate one time pin
    user.generate_one_time_pin()

    # Send email to user
    html_content = render_to_string(
        "verification_code.html",
        {
            "name": user.get_full_name(),
            "email": user.email,
            "code": user.one_time_pin,
        },
    )

    send_email.delay(user=user, html_content=html_content)

    text_message = f"Hi {user.get_full_name()}, use this verification code to verify your account:\n\n{user.one_time_pin}"
    send_sms_text.delay(user.patient.get_mobile_number, text_message)


@job("auth")
def send_password_reset_otp(user: User):
    # generate one time pin
    user.generate_one_time_pin()

    html_content = render_to_string(
        "forgot_password.html",
        {
            "name": user.get_full_name(),
            "email": user.email,
            "code": user.one_time_pin,
        },
    )
    send_email.delay(
        user=user,
        html_content=html_content,
        email_subject="Forgot Password",
    )


@job("auth")
def notify_user_that_their_password_has_been_updated(user: User, date: datetime):
    """
    Notify user that their password has been updated
    """

    human_readable_date = readable_date(date)

    html_content = render_to_string(
        "notification.html",
        {
            "message": f"Good day, {user.get_full_name()}.\n\nYour password was successfully updated on "
            f"{human_readable_date}.",
            "email": user.email,
        },
    )
    send_email_alt.delay(
        email=user.email, html_content=html_content, email_subject="Password Update"
    )
    logger.info("[Job]: Task Executed!")
