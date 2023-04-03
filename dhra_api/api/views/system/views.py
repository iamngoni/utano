#
#  views.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from loguru import logger
from rest_framework.views import APIView

from api.views.system.serializers.model import (
    ProvinceModelSerializer,
    DistrictModelSerializer,
    ApiRequestModelSerializer,
)
from services.helpers.api_response import ApiResponse
from system.models import (
    Province,
    District,
    ApiRequest,
    Gender,
    SystemStatus,
    MaritalStatus,
    EmploymentStatus,
    RelationshipType,
)


class ProvincesView(APIView):
    def get(self, request):
        try:
            provinces = Province.objects.all()
            return ApiResponse(
                data={"provinces": ProvinceModelSerializer(provinces, many=True).data}
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class DistrictsView(APIView):
    def get(self, request):
        try:
            districts = District.objects.all()
            return ApiResponse(
                data={"districts": DistrictModelSerializer(districts, many=True).data}
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class ApiRequestsView(APIView):
    def get(self, request):
        try:
            api_requests = ApiRequest.objects.all()
            return ApiResponse(
                data={
                    "api_requests": ApiRequestModelSerializer(
                        api_requests, many=True
                    ).data
                }
            )
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class GenderView(APIView):
    def get(self, request):
        try:
            genders = Gender.get_mapped_list_of_choices()
            return ApiResponse(data={"genders": genders})
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class SystemStatusView(APIView):
    def get(self, request):
        try:
            statuses = SystemStatus.get_mapped_list_of_choices()
            return ApiResponse(data={"statuses": statuses})
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class MaritalStatusView(APIView):
    def get(self, request):
        try:
            statuses = MaritalStatus.get_mapped_list_of_choices()
            return ApiResponse(data={"statuses": statuses})
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class EmploymentStatusView(APIView):
    def get(self, request):
        try:
            statuses = EmploymentStatus.get_mapped_list_of_choices()
            return ApiResponse(data={"statuses": statuses})
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)


class RelationshipTypeView(APIView):
    def get(self, request):
        try:
            types = RelationshipType.get_mapped_list_of_choices()
            return ApiResponse(data={"types": types})
        except Exception as exc:
            logger.error(exc)
            return ApiResponse(num_status=500, bool_status=False)
