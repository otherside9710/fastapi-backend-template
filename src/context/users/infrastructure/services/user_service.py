from src.context.users.domain.entities import User
from src.context.users.domain.contracts.user_management_service import UserManagementService
from src.context.users.domain.contracts.user_persistence_repository import UserPersistenceRepository
from src.context.users.application.use_cases import CreateUserUseCase

class UserManagementServiceImpl(UserManagementService):
    def __init__(self, repository: UserPersistenceRepository):
        self._repository = repository
        # Initialize use cases with the repository
        self._create_user_use_case = CreateUserUseCase(repository)

    async def create_user(self, user: User) -> User:
        """
        Service method to create a user using the create user use case
        """
        return await self._create_user_use_case.execute(user)
