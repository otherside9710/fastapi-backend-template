from abc import ABC, abstractmethod
from src.context.users.domain.entities import User

class UserManagementService(ABC):
    """
    Service interface for managing user operations and orchestrating use cases
    """
    @abstractmethod
    async def create_user(self, user: User) -> User:
        """Create a new user through the appropriate use case"""
        pass
