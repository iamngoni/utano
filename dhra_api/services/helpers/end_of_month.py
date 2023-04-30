#
#  end_of_month.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 30/4/2023.
#  Copyright (c) 2023 ModestNerds, Co

from django.utils import timezone

year = timezone.now().year

end_of_month: dict = {
    1: 31,
    2: 29 if year % 4 == 0 else 28,
    3: 31,
    4: 30,
    5: 31,
    6: 30,
    7: 31,
    8: 31,
    9: 30,
    10: 31,
    11: 30,
    12: 31,
}
