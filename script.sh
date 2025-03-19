#!/bin/bash

# Nombre del proyecto
PROJECT_NAME="fastapi-backend"
SRC_DIR="$PROJECT_NAME/src"

# Crear directorios
mkdir -p $SRC_DIR/context/users/domain
mkdir -p $SRC_DIR/context/users/application
mkdir -p $SRC_DIR/context/users/infrastructure
mkdir -p $SRC_DIR/context/users/infrastructure/persistence
mkdir -p $SRC_DIR/context/users/infrastructure/services
mkdir -p $SRC_DIR/context/users/infrastructure/database
mkdir -p $SRC_DIR/app
mkdir -p $PROJECT_NAME/config

# Crear archivos base
touch $SRC_DIR/__init__.py
touch $SRC_DIR/context/__init__.py
touch $SRC_DIR/context/users/__init__.py
touch $SRC_DIR/context/users/domain/__init__.py
touch $SRC_DIR/context/users/application/__init__.py
touch $SRC_DIR/context/users/infrastructure/__init__.py
touch $SRC_DIR/context/users/infrastructure/persistence/__init__.py
touch $SRC_DIR/context/users/infrastructure/services/__init__.py
touch $SRC_DIR/context/users/infrastructure/database/__init__.py
touch $SRC_DIR/app/__init__.py
touch $PROJECT_NAME/config/.env

# Crear archivos Python con contenido básico
cat <<EOL > $SRC_DIR/context/users/domain/entities.py
import uuid
from pydantic import BaseModel

class User(BaseModel):
    id: str = str(uuid.uuid4())
    name: str
    last_name: str
    email: str
    phone: str
EOL

cat <<EOL > $SRC_DIR/context/users/application/use_cases.py
from context.users.domain.entities import User
from context.users.infrastructure.persistence.repositories import UserRepository

class CreateUserUseCase:
    def __init__(self, repository: UserRepository):
        self.repository = repository

    async def execute(self, user: User) -> User:
        return await self.repository.create(user)
EOL

cat <<EOL > $SRC_DIR/context/users/infrastructure/database/database.py
import os
from motor.motor_asyncio import AsyncIOMotorClient

MONGO_URL = os.getenv("MONGO_URL", "mongodb://admin:pass@localhost:27017")
client = AsyncIOMotorClient(MONGO_URL)
db = client.example  # Nombre de la base de datos
EOL

cat <<EOL > $SRC_DIR/context/users/infrastructure/persistence/repositories.py
from context.users.domain.entities import User
from context.users.infrastructure.database.database import db

class UserRepository:
    async def create(self, user: User) -> User:
        await db.users.insert_one(user.dict())
        return user
EOL

cat <<EOL > $SRC_DIR/app/users.py
from fastapi import APIRouter, Depends
from context.users.domain.entities import User
from context.users.application.use_cases import CreateUserUseCase
from context.users.infrastructure.persistence.repositories import UserRepository

router = APIRouter()

@router.post("/users/")
async def create_user(user: User, use_case: CreateUserUseCase = Depends()):
    return await use_case.execute(user)
EOL

cat <<EOL > $SRC_DIR/main.py
from fastapi import FastAPI
from app import users

app = FastAPI()

app.include_router(users.router)

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000, reload=True)
EOL

cat <<EOL > $PROJECT_NAME/requirements.txt
fastapi
uvicorn
motor
python-dotenv
EOL

cat <<EOL > $PROJECT_NAME/README.md
# FastAPI Backend Template 🚀

This is a **FastAPI** backend template following **Hexagonal Architecture** and **DDD**.

## 📌 Tech Stack:
- **FastAPI** as the web framework
- **MongoDB** as the database
- **Motor** for async MongoDB connections
- **Hexagonal Architecture** for clean separation of concerns
- **DDD (Domain-Driven Design)** for better structuring

## 📂 Project Structure:
\`\`\`
src/
│── context/
│   ├── users/
│   │   ├── domain/          # Entities & Models
│   │   ├── application/     # Use Cases
│   │   ├── infrastructure/  # Persistence, Services, Database
│── app/                     # Controllers (API Endpoints)
│── main.py                   # Entry point
\`\`\`

## 🚀 How to Run
1. Install dependencies:
   \`\`\`sh
   pip install -r requirements.txt
   \`\`\`
2. Run the application:
   \`\`\`sh
   uvicorn src.main:app --reload
   \`\`\`
3. API available at: **http://127.0.0.1:8000/docs**
EOL

echo "✅ Project structure created successfully!"
