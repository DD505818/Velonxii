# placeholder LevelMapper service
from fastapi import FastAPI
app = FastAPI()

@app.post('/levels')
async def levels(payload: dict):
    return {'received': payload}
