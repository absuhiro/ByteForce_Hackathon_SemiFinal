from pydantic import BaseModel
from typing import Optional



class ReviewCreate(BaseModel):
    business_id: str
    rating: int
    review_text: str


class ReviewResponse(BaseModel):
    id: str
    business_id: str
    rating: int
    review_text: str

    class Config:
        from_attributes = True


class ReviewAnalysisResponse(BaseModel):
    fake_probability: float
    label: str



class BusinessCreate(BaseModel):
    name: str


class BusinessResponse(BaseModel):
    id: str
    name: str

    class Config:
        from_attributes = True