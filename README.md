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

4. Create .env file

```bash
mv example.env .env
```

| Variable      | Description                                                                                | Example Value         |
|--------------|---------------------------------------------------------------------------------------------|-----------------------|
| BACKEND_URL  | Base URL where the backend is accessible.                                                   | http://localhost:5000 |
| ALLOWED_HOST | Hostname allowed to access the backend (for security purposes).                             | localhost             |
| CORS_ORIGIN  | Origin allowed for Cross-Origin Resource Sharing (CORS).                                    | localhost:4000        |

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

### Useful Commands

- Start containers: `docker-compose up -d`
- Stop containers: `docker-compose down`
- Show logs: `docker-compose logs <container-name>`