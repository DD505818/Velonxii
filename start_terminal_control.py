
import os
import requests

def check_status():
    print("Checking VELON agent status...")
    # Placeholder endpoint
    resp = requests.get("http://localhost:8000/api/agent/status")
    print("Status:", resp.json())

def send_command(command):
    print(f"Sending command: {command}")
    # Placeholder for sending command to backend
    resp = requests.post("http://localhost:8000/api/agent/command", json={"cmd": command})
    print("Response:", resp.text)

if __name__ == "__main__":
    print("VELON Terminal Control Initialized")
    check_status()
    send_command("run_live_trading")
