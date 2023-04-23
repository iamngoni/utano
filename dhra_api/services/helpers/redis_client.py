#
#  redis_client.py
#  dhra_api
#
#  Created by Ngonidzashe Mangudya on 23/4/2023.
#  Copyright (c) 2023 ModestNerds, Co

from redis.client import Redis

redis_client = Redis(client_name="UtanoRedisClient")
