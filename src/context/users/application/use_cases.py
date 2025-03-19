from src.context.users.domain.entities import User
from src.context.users.domain.contracts.user_persistence_repository import UserPersistenceRepository

class CreateUserUseCase:
    """
    Use case for creating a new user
    """
    def __init__(self, repository: UserPersistenceRepository):
        self._repository = repository

    async def execute(self, user: User) -> User:
        """
        Execute the use case to create a new user
        """
        return await self._repository.create(user)
