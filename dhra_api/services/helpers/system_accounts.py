"""
@project        hekima
@author         Ngonidzashe Mangudya
@created_at     27/9/2022
"""
from loguru import logger

from services.helpers.generate_account_number import generate_account_number
from users.models import User, UserRoles, Account


class SystemAccounts:
    def __init__(self, user: User):
        self.user = user

    def create_account(self):
        account = Account(
            user=self.user,
            account_number=generate_account_number(),
        )
        account.save()
