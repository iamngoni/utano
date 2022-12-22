from collections import OrderedDict

from django_user_agents.utils import get_user_agent
from loguru import logger


def get_client_details(request) -> OrderedDict:
    x_forwarded_for = request.META.get("HTTP_X_FORWARDED_FOR")
    if x_forwarded_for:
        ip = x_forwarded_for.split(",")[0]
    else:
        ip = request.META.get("REMOTE_ADDR")

    remote_host = request.META.get("REMOTE_HOST")
    logger.debug(f"REMOTE HOST: {remote_host}")
    logger.debug(f"IP: {ip}")
    user_agent = get_user_agent(request)
    browser = user_agent.browser.family
    os = user_agent.os.family
    os_version = user_agent.os.version_string
    family = user_agent.device.family

    client = f"{browser} - {family} - {os}({os_version})"

    return OrderedDict(
        [("ip", ip), ("remote_host", remote_host), ("user_agent", client)]
    )
