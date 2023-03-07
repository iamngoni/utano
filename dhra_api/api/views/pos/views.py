#
#  views.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView

from services.permissions.is_employee import IsEmployee


class PatientCheckInView(APIView):
    permission_classes = (IsAuthenticated, IsEmployee)

    def post(self, request):
        pass
