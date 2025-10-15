# Dummy Request Counter 🧮

This is a simple FastAPI application that counts how many times the page has been visited.  
The app uses **Redis** as a database to store the number of hits.

---

## 🚀 How to Run

### 1️⃣ Prerequisites
- Docker and Docker Compose installed

### 2️⃣ Build and Run the Containers
```bash
docker compose up --build
```

This will:

Start a Redis container (port 6379)

Start a FastAPI container (port 8000)

To test the API, you can then open your browser and visit: http://localhost:8000/

or by using Postman and sending a GET request to http://localhost:8000/

# 🛠️ Custom Docker Network

We created a custom Docker network called my-network to connect the web and redis containers explicitly.
### How it was implemented

In docker-compose.yml:
```bash
networks:
  my-network:
    driver: bridge
```

Then each service was connected to this network:
```bash
services:
  redis:
    ...
    networks:
      - my-network

  web:
    ...
    networks:
      - my-network
```

Now the web container communicates with Redis via the hostname redis over the custom network my-network.