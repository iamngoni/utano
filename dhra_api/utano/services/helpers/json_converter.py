import json


def to_json(data: dict):
    return json.dumps(data)


def from_json(data):
    return json.loads(data)
