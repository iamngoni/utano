from app.models.soft_delete_model import SoftDeleteModel
from sqlalchemy import Column, Integer, DateTime, String


class User(SoftDeleteModel):
    first_name = Column(String, nullable=False)
    last_name = Column(String, nullable=False)
    email = Column(String, nullable=False)
    password = Column(String, nullable=False)