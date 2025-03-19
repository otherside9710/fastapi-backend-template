import uuid
from pydantic import BaseModel

class User(BaseModel):
    id: str = str(uuid.uuid4())
    name: str
    last_name: str
    email: str
    phone: str
