#!/data/data/com.termux/files/usr/bin/bash
export $(cat .env.velonx11 | xargs)
nohup python3 app.py > flask.log 2>&1 &
nohup python3 vx11_agent_manager.py > agent.log 2>&1 &
cd frontend && nohup npm run dev > ../ui.log 2>&1 &
cd .. && nohup ./ngrok http 3000 > ngrok.log 2>&1 &
