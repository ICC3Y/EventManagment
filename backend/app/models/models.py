from sqlalchemy import Column, Integer, String, Float, Boolean, DateTime
from datetime import datetime
from app.core.database import Base

class Incident(Base):
    __tablename__ = "incidents"

    id = Column(Integer, primary_key=True, index=True)
    category = Column(String, index=True) # e.g., 'Medical', 'Spill', 'Security'
    severity = Column(String) # e.g., 'Low', 'High'
    location_x = Column(Float)
    location_y = Column(Float)
    status = Column(String, default="Open") # Open, In Progress, Resolved
    reported_at = Column(DateTime, default=datetime.utcnow)

class Gate(Base):
    __tablename__ = "gates"
    
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True, unique=True) # e.g., "Gate A"
    throughput_per_minute = Column(Integer, default=0)
    status = Column(String, default="Normal") # Normal, Crowded
    lat = Column(Float)
    lng = Column(Float)

class Concession(Base):
    __tablename__ = "concessions"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True)
    category = Column(String) # e.g., 'Vegan', 'High-Protein', 'Standard'
    estimated_wait_min = Column(Integer, default=0)
    lat = Column(Float)
    lng = Column(Float)
