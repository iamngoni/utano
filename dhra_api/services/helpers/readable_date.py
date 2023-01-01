import datetime
from loguru import logger

months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
]


def readable_date(date: datetime) -> str:
    logger.debug(f"date: {date}")
    try:
        month = months[date.month - 1]
        return f"{date.day} {month}, {date.year}"
    except Exception as e:
        logger.error(f"failed to return proper date: {e}")
        return "hello world"


def readable_date_time_string(date: str):
    """
    construct a readable date string from another proper datetime string
    @param date:
    @return:
    """
    logger.debug(f"date: {date}")
    try:
        date_time = date.split(" ")
        date_string = date_time[0]
        time_string = date_time[1]

        date_figures_array = date_string.split("-")
        formatted_date = f"{date_figures_array[2]} {months[int(date_figures_array[1]) - 1]} {date_figures_array[0]}"

        time_figures_array = time_string.split(":")
        time_period = "pm" if int(time_figures_array[0]) >= 12 else "am"
        formatted_time = f"{divmod(int(time_figures_array[0]), 12)[1]}:{time_figures_array[1]} {time_period}"
        return formatted_date, formatted_time
    except Exception as e:
        logger.error(f"failed to return proper date: {e}")
        raise
