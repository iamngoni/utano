import datetime

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
    month = months[date.month - 1]
    return f"{date.day} {month}, {date.year}"
