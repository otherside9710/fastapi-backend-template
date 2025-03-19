from fastapi import APIRouter, Depends
from src.context.users.domain.entities import User
from src.context.users.domain.contracts.user_management_service import UserManagementService
from src.context.users.infrastructure.services.user_service import UserManagementServiceImpl
from src.context.users.infrastructure.persistence.mongo_user_repository import MongoUserRepository

router = APIRouter()

def get_repository() -> MongoUserRepository:
    return MongoUserRepository()

def get_user_service(repository: MongoUserRepository = Depends(get_repository)) -> UserManagementService:
    return UserManagementServiceImpl(repository)

@router.post("/users/", response_model=User)
async def create_user(user: User, service: UserManagementService = Depends(get_user_service)) -> User:
    """
    Create a new user using the user management service, which internally uses the create user use case
    """
    return await service.create_user(user)
