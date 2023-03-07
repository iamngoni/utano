#
#  urls.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from django.urls import path

from api.views.system.views import (
    ProvincesView,
    DistrictsView,
    ApiRequestsView,
    GenderView,
    SystemStatusView,
    MaritalStatusView,
    EmploymentStatusView,
    RelationshipTypeView,
)

urlpatterns = [
    path("provinces", ProvincesView.as_view(), name="Provinces View"),
    path("districts", DistrictsView.as_view(), name="Districts View"),
    path("api_requests", ApiRequestsView.as_view(), name="API Requests View"),
    path("genders", GenderView.as_view(), name="Gender View"),
    path("system_statuses", SystemStatusView.as_view(), name="System Statuses"),
    path("marital_statuses", MaritalStatusView.as_view(), name="Marital Status View"),
    path(
        "employment_statuses",
        EmploymentStatusView.as_view(),
        name="Employment Status View",
    ),
    path(
        "relationship_types",
        RelationshipTypeView.as_view(),
        name="Relationship Type View",
    ),
]
