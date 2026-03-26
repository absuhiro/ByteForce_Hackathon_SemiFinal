from fastapi import APIRouter
from app.services.fake_detector import detect_fake_review

router = APIRouter(prefix="/analysis", tags=["Analysis"])

@router.post("/review")
def analyze_review(data: dict):
    text = data["review_text"]
    rating = data["rating"]

    score = detect_fake_review(text, rating)

    return {
        "fake_probability": score,
        "label": "FAKE" if score > 0.7 else "GENUINE"
    }