"""
@project        hekima
@author         Ngonidzashe Mangudya
@created_at     20/9/2022
"""
import stripe
from decouple import config
from django.utils import timezone
from loguru import logger

from patient.models import Profile
from therapist.models import Profile as TherapistProfile
from subscriptions.models import (
    SubscriptionPlan,
    SubscriptionPlanOptions,
    PatientSubscription,
    Order,
)


class StripeSubscriptions:
    def __init__(self, subscription_plan: SubscriptionPlan):
        stripe.api_key = config("STRIPE_SECRET_KEY")
        self.subscription_plan = subscription_plan

    def create_product(self):
        # find existing product
        existing_product = self.get_product()

        # if one exists return that one else create a new one
        if existing_product is not None:
            return existing_product

        logger.info("[Stripe Subscriptions]: None found. Creating product")
        product = stripe.Product.create(
            name=self.subscription_plan.subscription.name,
            description=self.subscription_plan.subscription.description,
            type="service",
        )

        self.subscription_plan.subscription.stripe_product_id = product.id
        self.subscription_plan.subscription.save()

        return product

    def get_product(self):
        if self.subscription_plan.subscription.stripe_product_id is not None:
            return stripe.Product.retrieve(
                self.subscription_plan.subscription.stripe_product_id
            )
        else:
            return None

    def create_price(self):
        product = self.create_product()

        price = stripe.Price.create(
            unit_amount=int(self.subscription_plan.price * 100),
            recurring={
                "interval": "month",
                "interval_count": self.get_interval_count(),
            },
            currency="usd",
            product=product.id,
            nickname=self.subscription_plan.option,
        )

        self.subscription_plan.stripe_price_id = price.id
        self.subscription_plan.save()

    def get_interval_count(self):
        if self.subscription_plan.option == SubscriptionPlanOptions.MONTHLY:
            return 1
        elif self.subscription_plan.option == SubscriptionPlanOptions.QUARTERLY:
            return 3
        elif self.subscription_plan.option == SubscriptionPlanOptions.BI_YEARLY:
            return 6
        elif self.subscription_plan.option == SubscriptionPlanOptions.YEARLY:
            return 12
        else:
            return 1

    def update_price(self):
        # since Stripe doesn't allow deletion or modification of prices
        # here we will archive the existing price and create a new one
        logger.info("[Stripe Subscriptions]: archiving existing price")
        stripe.Price.modify(self.subscription_plan.stripe_price_id, active=False)
        logger.success("[Stripe Subscriptions]: price archive. now creating new price")
        self.create_price()

    def remove_price(self):
        # since Stripe doesn't allow deletion or modification of prices
        # here we will archive the price
        logger.info("[Stripe Subscriptions]: archiving price")
        stripe.Price.modify(self.subscription_plan.stripe_price_id, active=False)
        logger.success("[Stripe Subscriptions]: price archived")

    @classmethod
    def remove_product(cls, subscription):
        stripe.api_key = config("STRIPE_SECRET_KEY")
        if subscription.stripe_product_id is not None:
            logger.info("[Stripe Subscriptions]: archiving product")
            stripe.Product.modify(subscription.stripe_product_id, active=False)
            logger.success("[Stripe Subscriptions]: product archived")
        else:
            logger.info("[Stripe Subscriptions]: no product to archive")

    def checkout_price(self, customer: Profile, therapist: TherapistProfile):
        """
        Create a checkout session for the customer
        :param customer: the patient to create the checkout session for
        :param therapist: the therapist to create the checkout session for
        :return: the checkout session url
        """

        logger.info("[Stripe Subscriptions]: creating checkout session")

        if customer.has_active_subscription is True:
            logger.error(
                "[Stripe Subscriptions]: customer already has an active subscription"
            )
            return None

        checkout_session = stripe.checkout.Session.create(
            line_items=[
                {
                    "price": self.subscription_plan.stripe_price_id,
                    "quantity": 1,
                }
            ],
            mode="subscription",
            customer=customer.stripe_customer_id,
            success_url="https://hekima.modestnerd.co/subscription/success",
            cancel_url="https://hekima.modestnerd.co/subscription/cancel",
        )
        logger.success("[Stripe Subscriptions]: checkout session created")

        # create an order for patient
        logger.info("[Stripe Subscriptions]: creating order")
        order = Order(
            patient=customer,
            subscription_plan=self.subscription_plan,
            checkout_info_1=checkout_session.id,
            checkout_info_2=checkout_session.payment_intent,
            checkout_info_3=checkout_session.url,
            linked_therapist=therapist,
        )
        order.save()
        logger.success("[Stripe Subscriptions]: order created")

        return checkout_session.url

    @classmethod
    def generate_expiration_date(cls, subscription_plan: SubscriptionPlan):
        """
        Generate the expiration date for the subscription using
        subscription plan option
        :return: the expiration date
        """
        today = timezone.now()

        if subscription_plan.option == SubscriptionPlanOptions.MONTHLY:
            return today + timezone.timedelta(days=30)
        elif subscription_plan.option == SubscriptionPlanOptions.QUARTERLY:
            return today + timezone.timedelta(days=90)
        elif subscription_plan.option == SubscriptionPlanOptions.BI_YEARLY:
            return today + timezone.timedelta(days=180)
        elif subscription_plan.option == SubscriptionPlanOptions.YEARLY:
            return today + timezone.timedelta(days=365)
        else:
            return today + timezone.timedelta(days=30)
