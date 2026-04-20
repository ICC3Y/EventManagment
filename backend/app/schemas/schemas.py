from pydantic import BaseModel
from typing import Optional
from datetime import datetime

class IncidentBase(BaseModel):
    category: str
    severity: str
    location_x: float
    location_y: float

class IncidentCreate(IncidentBase):
    pass

class IncidentResponse(IncidentBase):
    id: int
    status: str
    reported_at: datetime
    
    class Config:
        from_attributes = True

class GateBase(BaseModel):
    name: str
    throughput_per_minute: int
    status: str
    lat: float
    lng: float

class GateResponse(GateBase):
    id: int

    class Config:
        from_attributes = True

class ConcessionBase(BaseModel):
    name: str
    category: str
    estimated_wait_min: int
    lat: float
    lng: float

class ConcessionResponse(ConcessionBase):
    id: int

    class Config:
        from_attributes = True
