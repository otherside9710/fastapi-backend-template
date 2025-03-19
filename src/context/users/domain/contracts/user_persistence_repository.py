from abc import ABC, abstractmethod
from src.context.users.domain.entities import User

class UserPersistenceRepository(ABC):
    """
    Repository interface for user persistence operations
    """
    @abstractmethod
    async def create(self, user: User) -> User:
        """Create a new user in the persistence layer"""
        pass
