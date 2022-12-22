from decouple import config
from fastapi import FastAPI

from app.routers import auth, users

app = FastAPI(
    title="utano",
    openapi_url=f"/api/{config('API_VERSION')}/openapi.json",
)

app.include_router(users.router, prefix="/users", tags=["users"])
app.include_router(auth.router, prefix="/auth", tags=["auth"])
