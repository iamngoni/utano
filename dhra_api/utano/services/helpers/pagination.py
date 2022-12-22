from loguru import logger
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response
from collections import OrderedDict


class HekimaPagination(PageNumberPagination):
    page_size = 10

    def get_paginated_response(self, data):
        next_link = self.get_next_link()
        if next_link is not None:
            next_link = next_link.split("1.0/")[1] if next_link is not None else None
        previous_link = self.get_previous_link()
        if previous_link is not None:
            previous_link = (
                previous_link.split("1.0/")[1] if previous_link is not None else None
            )
        current_page = self.get_page_number(self.request, paginator=self.page.paginator)
        values = [
            (
                "pagination",
                OrderedDict(
                    [
                        ("next", next_link),
                        ("previous", previous_link),
                        ("count", self.page.paginator.count),
                        ("current_page", current_page),
                    ]
                ),
            ),
            ("data", data),
        ]

        return Response(OrderedDict(values))
