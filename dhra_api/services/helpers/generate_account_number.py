# """
# @project        utano
# @author         Ngonidzashe Mangudya
# @created_at     24/12/2022
# """
# import random
# import string
#
# from loguru import logger
#
# from users.models import Account
#
#
# def generate_account_number() -> str:
#
#     account_number = generate_random_numbers(n=15)
#     logger.info("Checking if account number exists")
#     try:
#         account = Account.objects.get(account_number=account_number)
#         if account:
#             logger.error("Account already exists. Trying again!")
#             return generate_account_number()
#     except Exception:
#         logger.info(
#             f"Looks okay 👌. Account {account_number} does not exist. Using this one."
#         )
#         return account_number
