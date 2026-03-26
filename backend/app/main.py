from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.routes import reviews, business, analysis
from app.database import Base, engine

app = FastAPI(title="BYTE FORCE API")


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

Base.metadata.create_all(bind=engine)

app.include_router(reviews.router)
app.include_router(business.router)
app.include_router(analysis.router)


@app.get("/")
def root():
    return {"message": "BYTE FORCE running"}