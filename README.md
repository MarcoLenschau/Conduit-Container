# Conduit with Docker Compose

This project provide a Conduit container setup with using Docker Compose.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Quickstart](#quickstart)
3. [Usage](#usage)

## Prerequisites

- Docker
- Docker Compose
- Git

## Quickstart

1. Clone the repository

```bash
git clone https://github.com/MarcoLenschau/Conduit-Container
```

2. Change Directory

```bash
cd Conduit-Container
```

3. Init the submodules

```bash
git submodule init
```

4. Update the submodules

```bash
git submodule update
```

5. Create .env file

```bash
mv example.env .env
```

> [!IMPORTANT]
> Open `.env` and enter your own values.

5. Start the Containers

```bash
docker-compose up -d --build
```

### How to access the App

- Backend API: http://<ip-address>:5000/api
- Frontend: http://<ip-address>:4000

## Usage

### Env Variable

| Variable          | Description                                                                                 | Example Value                 |
|-------------------|---------------------------------------------------------------------------------------------|-------------------------------|
| BACKEND_URL       | Base URL where the backend is accessible.                                                   | http://localhost:5000         |
| ALLOWED_HOST      | Hostname allowed to access the backend (for security purposes).                             | localhost                     |
| CORS_ORIGIN       | Origin allowed for Cross-Origin Resource Sharing (CORS). Use a full origin including scheme.| http://localhost:8282         |
| DEBUG             | Enable Django debug mode. Set to True for development, False in production.                 | False                         |
| SECRET_KEY        | Django secret key used for cryptographic signing. Keep this secret in production.           | change-me-please              |
| POSTGRES_DB       | Name of the PostgreSQL database to use.                                                     | conduit                       |
| POSTGRES_USER     | PostgreSQL username used by the app.                                                        | conduit                       |
| POSTGRES_PASSWORD | Password for the PostgreSQL user. Keep secret in production (use a secret manager).         | conduit_password              |
| POSTGRES_HOST     | Host or Docker service name for the Postgres server (in compose this is the service name).  | postgres                      |
| POSTGRES_PORT     | Port where Postgres listens.                                                                | 5432                          |

### Useful Commands

- Start containers: `docker-compose up -d`
- Stop containers: `docker-compose down`
- Show logs: `docker-compose logs <container-name>`