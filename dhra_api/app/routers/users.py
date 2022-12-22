from fastapi import APIRouter

router = APIRouter()


@router.get("/", tags=["users"])
def read_root():
    return {"Hello": "World"}
