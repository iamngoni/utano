#
#  encryption.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 9/4/2023.
#  Copyright (c) 2023 ModestNerds, Co

import base64
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad, unpad
from django.conf import settings

key = settings.AES_SECRET_KEY


def encrypt(raw):
    raw = pad(raw.encode(), 16)
    cipher = AES.new(key.encode("utf-8"), AES.MODE_ECB)
    return base64.b64encode(cipher.encrypt(raw)).decode("utf-8")


def decrypt(enc):
    enc = base64.b64decode(enc)
    cipher = AES.new(key.encode("utf-8"), AES.MODE_ECB)
    return unpad(cipher.decrypt(enc), 16)
