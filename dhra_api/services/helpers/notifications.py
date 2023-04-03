import smtplib
import ssl
from email.header import Header
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from decouple import config
from django_rq import job
from intelli_gateway.gateway_client import GatewayClient
from loguru import logger

from users.models import User

system_host = config("EMAIL_HOST")
system_email = config("EMAIL_ADDRESS")
system_port = config("EMAIL_PORT")
system_password = config("EMAIL_PASSWORD")


@job("notifications")
def send_email(user: User, html_content: str, email_subject: str = "Utano EHR"):
    if user.receive_email_notifications is False:
        logger.error("user has disabled receiving email notifications")
        logger.error("skipping process")
        return

    logger.info(f"sending email to {user.email}")

    context = ssl.create_default_context()
    server = smtplib.SMTP(host=system_host, port=system_port)

    email_message = MIMEMultipart()
    email_message["From"] = str(Header(f"Utano EHR <{system_email}>"))
    email_message["To"] = user.email
    email_message["Subject"] = email_subject

    email_message.attach(MIMEText(html_content, "html"))
    email_content = email_message.as_string()

    try:
        server.ehlo()
        server.starttls(context=context)
        server.ehlo()
        server.login(system_email, system_password)
        server.sendmail(config("EMAIL_ADDRESS"), user.email, email_content)
        logger.success("sending email completed.")
    except Exception as e:
        logger.error(e)
        raise


@job("notifications")
def send_email_alt(email: str, html_content: str, email_subject: str = "Utano EHR"):
    logger.info(f"sending email to {email}")

    context = ssl.create_default_context()
    server = smtplib.SMTP(host=system_host, port=system_port)

    email_message = MIMEMultipart()
    email_message["From"] = str(Header(f"Utano EHR <{system_email}>"))
    email_message["To"] = email
    email_message["Subject"] = email_subject

    email_message.attach(MIMEText(html_content, "html"))
    email_content = email_message.as_string()

    try:
        server.ehlo()
        server.starttls(context=context)
        server.ehlo()
        server.login(system_email, system_password)
        server.sendmail(config("EMAIL_ADDRESS"), email, email_content)
        logger.success("sending email completed.")
    except Exception as e:
        logger.error(e)
        raise


@job("notifications")
def send_sms_text(mobile_number: str, message: str):
    try:
        email = config("SMS_ID")
        password = config("SMS_KEY")
        logger.debug(email)
        logger.debug(password)
        client = GatewayClient(email, password)
        client.authenticate()
        # client.send_sms(message, receiver=mobile_number, sender_id="Tumai")
    except Exception as exc:
        logger.error(exc)
        raise
