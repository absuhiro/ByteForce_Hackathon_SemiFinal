from sqlalchemy import Column, String, Integer, Float, Text
from app.database import Base
import uuid


def gen_uuid():
    return str(uuid.uuid4())


class Business(Base):
    __tablename__ = "businesses"   

    id = Column(String, primary_key=True, default=gen_uuid)
    name = Column(String)


class Review(Base):
    __tablename__ = "reviews"

    id = Column(String, primary_key=True, default=gen_uuid)
    business_id = Column(String)
    rating = Column(Integer)
    review_text = Column(Text)

    
    fake_probability = Column(Float)


class ReviewAnalysis(Base):
    __tablename__ = "review_analysis"   

    id = Column(String, primary_key=True, default=gen_uuid)
    review_id = Column(String)
    fake_probability = Column(Float)