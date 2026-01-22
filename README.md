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

3. Start the Containers

```bash
docker-compose up -d
```

### How to access the App

- Backend API: http://localhost:5000/api
- Frontend: http://localhost:4000

## Usage

### Useful Commands

- Start containers: `docker-compose up -d`
- Stop containers: `docker-compose down`
- Show logs: `docker-compose logs <container-name>`