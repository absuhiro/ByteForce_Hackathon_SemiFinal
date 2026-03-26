from fastapi import APIRouter
from app.database import SessionLocal
from app.models import Review
from app.schemas import ReviewCreate
from app.services.fake_detector import detect_fake_review

router = APIRouter(prefix="/reviews", tags=["Reviews"])

@router.post("/")
def add_review(review: ReviewCreate):
    db = SessionLocal()

    fake_score = detect_fake_review(review.review_text, review.rating)

    new_review = Review(
        business_id=review.business_id,
        rating=review.rating,
        review_text=review.review_text,
        fake_probability=fake_score   
    )

    db.add(new_review)
    db.commit()
    db.refresh(new_review)

    return {
        "id": new_review.id,
        "fake_probability": fake_score,
        "label": "FAKE" if fake_score > 0.7 else "GENUINE"
    }


# ✅ GET REVIEWS BY BUSINESS
@router.get("/{business_id}")
def get_reviews(business_id: str):
    db = SessionLocal()

    reviews = db.query(Review).filter(Review.business_id == business_id).all()

    return reviews