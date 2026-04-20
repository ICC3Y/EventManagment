from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.core.database import engine, Base
from app.api import rest, websockets
from app.models import models  # noqa: F401

# Create database tables
Base.metadata.create_all(bind=engine)

app = FastAPI(
    title="Intelligent Venue Management API",
    description="Backend for Dynamic Gate Balancing, Squad Pings, and Triage Dashboard",
    version="1.0.0",
)

# Allow all CORS for hackathon simplicity
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(rest.router, prefix="/api")
app.include_router(websockets.router)

@app.get("/")
def read_root():
    return {"status": "Intelligent Venue Management Engine Online"}
