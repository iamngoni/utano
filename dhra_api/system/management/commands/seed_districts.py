#
#  seed_districts.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 6/3/2023.
#  Copyright (c) 2023 ModestNerds, Co
from django.core.management import BaseCommand
from loguru import logger

from system.models import Province, District


class Command(BaseCommand):
    help = "Seed districts and provinces"

    def handle(self, *args, **options):
        """
        using provinces and districts acquired from Wikipedia
        https://en.wikipedia.org/wiki/Districts_of_Zimbabwe
        """
        try:
            provinces = [
                {
                    "name": "Bulawayo",
                    "districts": [
                        "Bulawayo"
                    ]
                },
                {
                    "name": "Harare",
                    "districts": [
                        "Harare"
                    ]
                },
                {
                    "name": "Manicaland",
                    "districts": [
                        "Buhera",
                        "Chimanimani",
                        "Chipinge",
                        "Makoni",
                        "Mutare",
                        "Mutasa",
                        "Nyanga"
                    ]
                },
                {
                    "name": "Mashonaland Central",
                    "districts": [
                        "Bindura",
                        "Guruve",
                        "Mazowe",
                        "Mbire",
                        "Mount Darwin",
                        "Muzarabani",
                        "Mukumbura",
                        "Rushinga",
                        "Shamva"
                    ]
                },
                {
                    "name": "Mashonaland East",
                    "districts": [
                        "Chikomba",
                        "Goromonzi",
                        "Marondera",
                        "Mudzi",
                        "Murehwa",
                        "Mutoko",
                        "Seke",
                        "Uzumba Maramba Pfungwe",
                        "Wedza"
                    ]
                },
                {
                    "name": "Mashonaland West",
                    "districts": [
                        "Chegutu",
                        "Hurungwe",
                        "Kariba",
                        "Makonde",
                        "Mhondoro-Ngezi",
                        "Sanyati",
                        "Zvimba",
                        "Kadoma",
                        "Chinhoyi"
                    ]
                },
                {
                    "name": "Masvingo",
                    "districts": [
                        "Bikita",
                        "Chiredzi",
                        "Chivi",
                        "Gutu",
                        "Masvingo",
                        "Mwenezi",
                        "Zaka"
                    ]
                },
                {
                    "name": "Matabeleland North",
                    "districts": [
                        "Binga",
                        "Bubi",
                        "Hwange",
                        "Lupane",
                        "Nkayi",
                        "Tsholotsho",
                        "Umguza"
                    ]
                },
                {
                    "name": "Matabeleland South",
                    "districts": [
                        "Beitbridge",
                        "Bulilima",
                        "Gwanda",
                        "Insiza",
                        "Mangwe",
                        "Matobo",
                        "Umzingwane"
                    ]
                },
                {
                    "name": "Midlands",
                    "districts": [
                        "Chirumhanzu",
                        "Gokwe North",
                        "Gokwe South",
                        "Gweru",
                        "Kwekwe",
                        "Mberengwa",
                        "Shurugwi",
                        "Zvishavane"
                    ]
                }
            ]

            for province in provinces:
                province_obj = Province.objects.create(name=province["name"])
                for district in province["districts"]:
                    District.objects.create(name=district, province=province_obj)

            logger.success("Districts and provinces seeded successfully")
        except Exception as exc:
            logger.error(exc)
