from fastapi import APIRouter
from app.database import SessionLocal
from app.models import Business

router = APIRouter(prefix="/business", tags=["Business"])


@router.post("/")
def create_business(data: dict):
    db = SessionLocal()

    new_business = Business(name=data["name"])
    db.add(new_business)
    db.commit()
    db.refresh(new_business)

    return new_business


@router.get("/")
def get_all_businesses():
    db = SessionLocal()
    return db.query(Business).all()