from pydantic import BaseModel


class ApiRequest(BaseModel):
    method: str
    headers: str
    path: str
