# placeholder FastAPI entrypoint
from fastapi import FastAPI
app = FastAPI()

@app.get('/')
def read_root():
    return {'status': 'VELONX12 online'}
