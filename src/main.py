from fastapi import FastAPI
from src.app import users

app = FastAPI()

app.include_router(users.router)

# This is only used when running the file directly
if __name__ == "__main__":
    import uvicorn
    uvicorn.run("src.main:app", host="127.0.0.1", port=8000, reload=True)
