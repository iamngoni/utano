# """
# @project        utano
# @author         Ngonidzashe Mangudya
# @created_at     24/12/2022
# """
# import stripe
# from decouple import config
#
# from patient.models import Profile
#
#
# class StripeCustomers:
#     def __init__(self, patient_profile: Profile):
#         stripe.api_key = config("STRIPE_SECRET_KEY")
#         self.profile = patient_profile
#
#     def create_customer(self):
#         if self.profile.stripe_customer_id is None:
#             customer = stripe.Customer.create(
#                 email=self.profile.user.email, name=self.profile.user.get_full_name()
#             )
#             self.profile.stripe_customer_id = customer.id
#             self.profile.save()
#
#     def get_stripe_customer(self):
#         return stripe.Customer.retrieve(self.profile.stripe_customer_id)
#
#     def update_customer_details(self, **kwargs):
#         stripe.Customer.modify(self.profile.stripe_customer_id, **kwargs)
#
#     def delete_stripe_customer(self):
#         stripe.Customer.delete(self.profile.stripe_customer_id)
#         self.profile.stripe_customer_id = None
#         self.profile.save()
