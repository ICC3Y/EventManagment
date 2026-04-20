from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from typing import List
from app.core.database import get_db
from app.models import models
from app.schemas import schemas
from app.api.websockets import manager

router = APIRouter()

@router.get("/gates", response_model=List[schemas.GateResponse])
def get_gates(db: Session = Depends(get_db)):
    """Retrieve all gates and their current status."""
    return db.query(models.Gate).all()

@router.get("/concessions", response_model=List[schemas.ConcessionResponse])
def get_concessions(category: str = None, db: Session = Depends(get_db)):
    """Retrieve concession stands, optionally filtered by dietary category."""
    query = db.query(models.Concession)
    if category:
        query = query.filter(models.Concession.category == category)
    return query.all()

@router.get("/incidents", response_model=List[schemas.IncidentResponse])
def get_incidents(db: Session = Depends(get_db)):
    """Retrieve all active incidents for the triage dashboard."""
    return db.query(models.Incident).all()

@router.post("/incidents", response_model=schemas.IncidentResponse)
async def create_incident(incident: schemas.IncidentCreate, db: Session = Depends(get_db)):
    """Report a new incident from the mobile app."""
    db_incident = models.Incident(**incident.model_dump())
    db.add(db_incident)
    db.commit()
    db.refresh(db_incident)
    
    # Broadcast the new incident to the web dashboard in real-time
    incident_data = schemas.IncidentResponse.model_validate(db_incident).model_dump()
    # Convert datetime to string for JSON serialization
    incident_data["reported_at"] = incident_data["reported_at"].isoformat()
    await manager.broadcast(incident_data, topic="incidents")
    
    return db_incident
