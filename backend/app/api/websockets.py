from fastapi import APIRouter, WebSocket, WebSocketDisconnect
from typing import Dict, Set

router = APIRouter()

class ConnectionManager:
    def __init__(self):
        # active_connections maps topic to set of websockets for O(1) removal
        self.active_connections: Dict[str, Set[WebSocket]] = {}

    async def connect(self, websocket: WebSocket, topic: str):
        await websocket.accept()
        if topic not in self.active_connections:
            self.active_connections[topic] = set()
        self.active_connections[topic].add(websocket)

    def disconnect(self, websocket: WebSocket, topic: str):
        if topic in self.active_connections:
            self.active_connections[topic].discard(websocket)

    async def broadcast(self, message: dict, topic: str):
        if topic in self.active_connections:
            # Create a copy to iterate while allowing discards if errors occur
            for connection in list(self.active_connections[topic]):
                try:
                    await connection.send_json(message)
                except Exception:
                    self.active_connections[topic].discard(connection)

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
            # We use receive_json for cleaner parsing
            message = await websocket.receive_json()
            await manager.broadcast(message, topic=topic)
    except WebSocketDisconnect:
        manager.disconnect(websocket, topic)
    except Exception:
        manager.disconnect(websocket, topic)
