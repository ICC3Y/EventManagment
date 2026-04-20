from fastapi import APIRouter, WebSocket, WebSocketDisconnect
from typing import List, Dict
import json

router = APIRouter()

class ConnectionManager:
    def __init__(self):
        # active_connections maps topic to list of websockets
        self.active_connections: Dict[str, List[WebSocket]] = {
            "gates": [],
            "incidents": [],
            "pings": []
        }

    async def connect(self, websocket: WebSocket, topic: str):
        await websocket.accept()
        if topic in self.active_connections:
            self.active_connections[topic].append(websocket)
        else:
            self.active_connections[topic] = [websocket]

    def disconnect(self, websocket: WebSocket, topic: str):
        if topic in self.active_connections and websocket in self.active_connections[topic]:
            self.active_connections[topic].remove(websocket)

    async def broadcast(self, message: dict, topic: str):
        if topic in self.active_connections:
            for connection in self.active_connections[topic]:
                try:
                    await connection.send_json(message)
                except Exception:
                    # Handle disconnected clients that weren't cleaned up yet
                    pass

manager = ConnectionManager()

@router.websocket("/ws/{topic}")
async def websocket_endpoint(websocket: WebSocket, topic: str):
    """
    Connect to a specific topic channel:
    - gates: for dynamic gate balancing updates
    - incidents: for triage updates
    - pings: for squad friend-finding updates
    """
    await manager.connect(websocket, topic)
    try:
        while True:
            data = await websocket.receive_text()
            # If clients send messages, we broadcast them to the same topic
            message = json.loads(data)
            await manager.broadcast(message, topic=topic)
    except WebSocketDisconnect:
        manager.disconnect(websocket, topic)
