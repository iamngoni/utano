#
#  is_employee.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 7/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

from rest_framework.permissions import BasePermission

from users.models import UserRoles


class IsEmployee(BasePermission):
    message = "You must be an employee to access this resource."

    def has_permission(self, request, view):
        return request.user.role in [
            UserRoles.DOCTOR,
            UserRoles.ADMIN,
            UserRoles.NURSE,
            UserRoles.LAB_TECHNICIAN,
            UserRoles.HEALTH_INSTITUTION,
        ]
