import smtplib
import ssl
from email.header import Header
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from decouple import config
from loguru import logger

from users.models import User

system_host = config("EMAIL_HOST")
system_email = config("EMAIL_ADDRESS")
system_port = config("EMAIL_PORT")
system_password = config("EMAIL_PASSWORD")


def send_email(user: User, html_content: str, email_subject: str = "Hekima Therapists"):
    if user.receive_email_notifications is False:
        logger.error("[Send Email]: User has disabled receiving email notifications")
        logger.error("[Send Email]: Skipping process")
        return

    logger.info(f"[Send Email]: Sending email to {user.email}")

    context = ssl.create_default_context()
    server = smtplib.SMTP(host=system_host, port=system_port)

    email_message = MIMEMultipart()
    email_message["From"] = str(Header(f"Hekima Therapists <{system_email}>"))
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
        logger.info(f"[Notifications]: Sending email completed.")
    except Exception as e:
        logger.error(f"[Notifications]: Sending TLS mail exception here ---> {e}")


def send_email_alt(
    email: str, html_content: str, email_subject: str = "Hekima Therapists"
):

    logger.info(f"[Send Email]: Sending email to {email}")

    context = ssl.create_default_context()
    server = smtplib.SMTP(host=system_host, port=system_port)

    email_message = MIMEMultipart()
    email_message["From"] = str(Header(f"Hekima Therapists <{system_email}>"))
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
        logger.info(f"[Notifications]: Sending email completed.")
    except Exception as e:
        logger.error(f"[Notifications]: Sending TLS mail exception here ---> {e}")
