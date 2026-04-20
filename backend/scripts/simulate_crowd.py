import asyncio
import json
import random
import websockets
from datetime import datetime

# URL of the gate WebSocket (assumes local dev on port 8001)
WS_URL_GATES = "ws://localhost:8001/ws/gates"
WS_URL_PINGS = "ws://localhost:8001/ws/pings"

GATES = ["Gate A", "Gate B", "Gate C", "Gate D"]

async def simulate_crowd():
    """
    Continuously generates mock data for gate turnstile throughput.
    """
    while True:
        try:
            async with websockets.connect(WS_URL_GATES) as ws_gates, \
                       websockets.connect(WS_URL_PINGS) as ws_pings:
                print("Connected to telemetry WebSocket channels.")
                while True:
                    # 1. Simulate Gate Updates (Throughput)
                    gate_name = random.choice(GATES)
                    throughput = random.randint(30, 150)
                    status = "Crowded" if throughput > 100 else "Normal"
                    
                    gate_data = {
                        "id": random.randint(1, 4), # Mapping to IDs
                        "name": gate_name,
                        "throughput_per_minute": throughput,
                        "status": status,
                        "lat": 0.35 + random.uniform(-0.1, 0.1),
                        "lng": 0.55 + random.uniform(-0.1, 0.1),
                    }
                    print(f"[{datetime.now().time()}] Emitting telemetry: {gate_name} - {throughput}/min")
                    await ws_gates.send(json.dumps(gate_data))
                    
                    # 2. Simulate Squad Pings (Live Friend Locations)
                    ping_data = {
                        "user_id": f"Friend_{random.randint(1, 3)}",
                        "location_x": random.uniform(0.2, 0.8),
                        "location_y": random.uniform(0.2, 0.8)
                    }
                    print(f"[{datetime.now().time()}] Emitting Ping: {ping_data['user_id']}")
                    await ws_pings.send(json.dumps(ping_data))

                    await asyncio.sleep(3)
        except Exception as e:
            print(f"Connection lost, retrying in 5s: {e}")
            await asyncio.sleep(5)

if __name__ == "__main__":
    try:
        asyncio.run(simulate_crowd())
    except KeyboardInterrupt:
        print("\nTelemetry simulation stopped.")
    except Exception as e:
        print(f"Error connecting to WebSocket: {e}")
        print("Make sure the FastAPI server is running on port 8000.")
