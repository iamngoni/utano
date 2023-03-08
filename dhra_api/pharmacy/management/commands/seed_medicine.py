#
#  seed_medicine.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 8/3/2023.
#  Copyright (c) 2023 ModestNerds, Co

import numpy as np
import ast
from django.core.management import BaseCommand
from loguru import logger

from pharmacy.models import ApprovedMedicine


class Command(BaseCommand):
    help = "Seed medicine"

    def handle(self, *args, **options):
        # read csv file using pandas
        array = np.loadtxt(
            "pharmacy/approved-medicines.csv",
            delimiter=",",
            skiprows=1,
            dtype=str,
            usecols=(0, 1, 4, 6),
        )
        for item in array:
            logger.info(f"processing {item[1]}")
            trade_name = item[0].strip('"')
            generic_name = item[1].strip('"')
            form = item[2].strip('"')
            try:
                strengths = item[3].split(";")
                count = 0
                for strength in strengths:
                    count += 1
                    logger.info(f"process #{count}")
                    strength = strength.strip('"')
                    if strength:
                        medicine = ApprovedMedicine(
                            name=f"{trade_name} ({strength})",
                            description=f"{generic_name} ({form})".strip('"'),
                        )
                        medicine.save()
                        logger.success(f"processed {item[1]}")
            except Exception as exc:
                logger.error(exc)
                continue

        logger.success("seeded medicine successfully")
