from src.context.users.domain.entities import User
from src.context.users.domain.contracts.user_persistence_repository import UserPersistenceRepository
from src.context.users.infrastructure.database.database import db

class MongoUserRepository(UserPersistenceRepository):
    async def create(self, user: User) -> User:
        """
        Create a new user in the MongoDB database
        """
        await db.users.insert_one(user.dict())
        return user
