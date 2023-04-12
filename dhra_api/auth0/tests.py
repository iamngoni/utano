from rest_framework.test import APITestCase
from django.urls import reverse
from rest_framework import status

from services.helpers.create_username import create_username
from users.models import User, UserRoles


class AuthTest(APITestCase):
    def setUp(self) -> None:
        user = User(
            email="imngonii@gmail.com",
            first_name="Ngonidzashe",
            last_name="Mangudya",
            role=UserRoles.PATIENT,
            username=create_username(first_name="Ngonidzashe", last_name="Mangudya"),
        )
        user.set_password("123456@Me")
        user.save()

    def test_sign_in(self):
        """
        @description: Test sign in
        @return:
        """
        url = reverse("sign-in")
        data = {
            "username": "imngonii@gmail.com",
            "password": "123456@Me",
        }
        response = self.client.post(url, data, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
