from datetime import datetime

from sqlalchemy import Column, Integer, DateTime, String

from app.config import base


class SoftDeleteModel(base):
    id = Column(String, primary_key=True, index=True)
    deleted_at = Column(DateTime, nullable=True)

    def delete(self):
        self.deleted_at = datetime.utcnow()
        self.save()
