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
│   └── users/          # User-related controllers
├── context/
│   └── users/          # User domain logic
│       ├── application/    # Use cases
│       ├── domain/        # Entities and interfaces
│       └── infrastructure/  # Implementation details
└── main.py            # Application entry point
```

## Setup and Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd fastapi-backend-template
```

2. Create and activate virtual environment:
```bash
python3 -m venv venv
source venv/bin/activate  # On Windows use: venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Create a `.env` file in the root directory with the following content:
```
MONGO_URL=mongodb://localhost:27017
```

## Running the Application

1. Make sure MongoDB is running on your system

2. Start the application:
```bash
python src/main.py
```

The server will start at `http://127.0.0.1:8000`

## API Endpoints

### Users

- **Create User**
  - Method: POST
  - URL: `/users/`
  - Body:
    ```json
    {
        "name": "John",
        "last_name": "Doe",
        "email": "john@example.com",
        "phone": "1234567890"
    }
    ```

## Testing the API

You can test the API using curl or any API client like Postman:

```bash
curl -X POST http://localhost:8000/users/ \
     -H "Content-Type: application/json" \
     -d '{"name": "John", "last_name": "Doe", "email": "john@example.com", "phone": "1234567890"}'
```

## Development

The project follows clean architecture principles:
- Domain layer contains business logic and entities
- Application layer contains use cases
- Infrastructure layer contains implementations
- App layer contains controllers and API endpoints

---
Made with ❤️ by Otherside
