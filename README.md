# FastAPI Backend Template

A clean architecture template for FastAPI applications with MongoDB integration.

## Prerequisites

- Python 3.8+
- MongoDB
- Git

## Project Structure

```
src/
├── app/
│   └── users/                      # User-related controllers
│       ├── __init__.py
│       └── user_controller.py      # User endpoints
├── context/
│   └── users/                      # User domain logic
│       ├── application/            # Use cases
│       │   ├── __init__.py
│       │   └── use_cases.py
│       ├── domain/                 # Domain model
│       │   ├── contracts/          # Interfaces
│       │   │   ├── __init__.py
│       │   │   ├── user_management_service.py
│       │   │   └── user_persistence_repository.py
│       │   ├── __init__.py
│       │   └── entities.py
│       └── infrastructure/         # Implementation details
│           ├── database/           # Database configuration
│           │   ├── __init__.py
│           │   └── database.py
│           ├── persistence/        # Repository implementations
│           │   ├── __init__.py
│           │   └── mongo_user_repository.py
│           └── services/          # Service implementations
│               ├── __init__.py
│               └── user_service.py
└── main.py                        # Application entry point
```

## Features

- Hexagonal Architecture
- Domain-Driven Design principles
- MongoDB integration with Motor
- Async operations
- Clean separation of concerns
- Dependency injection
- Environment configuration

## Installation

1. Clone the repository:
   ```bash
   git clone git@github.com:otherside9710/fastapi-backend-template.git
   ```
2. Create a virtual environment: `python -m venv venv`
3. Activate the virtual environment:
   - Windows: `venv\Scripts\activate`
   - Unix/MacOS: `source venv/bin/activate`
4. Install dependencies: `pip install -r requirements.txt`
5. Create a `.env` file with:
   ```
   MONGO_URL=mongodb://localhost:27017
   ```

## Running the Application

1. Make sure MongoDB is running
2. Activate the virtual environment (if not already activated)
3. Run: `uvicorn src.main:app --reload`
4. Visit http://localhost:8000/docs for the API documentation

## API Documentation

- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

## Development

The project follows hexagonal architecture principles with:

1. Domain Layer (`/domain/`):
   - Entities (core business objects)
   - Contracts (interfaces/ports)

2. Application Layer (`/application/`):
   - Use Cases (business logic)

3. Infrastructure Layer (`/infrastructure/`):
   - Services (orchestration)
   - Repositories (data persistence)
   - Database configuration

4. Controllers Layer (`/app/`):
   - REST endpoints
   - Dependency injection

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---
Made with ❤️ by Otherside
