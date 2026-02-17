# Conduit with Docker Compose

This project provide a Conduit container setup with using Docker Compose.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Quickstart](#quickstart)
3. [Usage](#usage)
4. [Deployment](#deployment)
5. [GitHub Secrets](#github-secrets)

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

## Deployment

This project uses **GitHub Actions** for automated deployment to a remote server. The deployment workflow is triggered on every push to the `main` or `auto-deploment` branches, as well as on pull requests to these branches.

### Deployment Workflow

The workflow (`.github/workflows/deploy.yaml`) performs the following steps:

1. **Checkout repository** - Pulls the latest code from the repository
2. **Initialize and update submodules** - Ensures all submodules are up-to-date
3. **Create environment file** - Generates a .env file on the server using GitHub Secrets
4. **Log in to GitHub Container Registry** - Authenticates with GitHub Container Registry
5. **Build and push docker images** - Builds Docker images for the backend and frontend, then pushes them to the GitHub Container Registry
6. **Copy files via SCP** - Transfers docker-compose and env file to the remote server
7. **Execute commands via SSH** - Connects to the server and deploy the docker container

### Prerequisites for Deployment

Before using the deployment workflow, ensure you ~have:

- A remote server with Docker and Docker Compose installed
- SSH access to the remote server with a private key
- GitHub repository with access to configure Secrets
- Administrative access to create/manage GitHub Secrets

### Setting Up Deployment

1. Generate or obtain an SSH private key for your server
2. Add the following secrets to your GitHub repository:
   - Go to: **Settings → Secrets and variables → Actions**
   - Click **New repository secret** and add each required secret (see section below)

## GitHub Secrets

The following secrets must be configured in your GitHub repository for the deployment workflow to function correctly:

| Secret Name         | Description                                                               | Example Value                   |
|---------------------|---------------------------------------------------------------------------|---------------------------------|
| `HOST`              | IP address or hostname of the remote server                               | http://localhost:5000           |
| `USERNAME`          | SSH username to connect to the remote server                              | github                          |
| `PORT`              | SSH port                                                                  | 22                              |
| `PRIVATE_KEY`       | SSH private key for authentication                                        | Multiline private key content   |
| `DIRECTORY`         | Absolute path on the remote server where the project should be deployed   | /home/github/Conduit-Container  |
| `BACKEND_URL`       | Base URL where the backend is accessible from the internet                | http://localhost:5000           |
| `CORS_ORIGIN`       | Origin allowed for CORS requests (must match frontend URL)                | localhost                       |
| `DEBUG`             | Django debug mode (should be False in production)                         | False                           |
| `SECRET_KEY`        | Django secret key (should be a long, random string in production)         | Long random string              |
| `POSTGRES_DB`       | PostgreSQL database name                                                  | conduit                         |
| `POSTGRES_USER`     | PostgreSQL username                                                       | conduit                         |
| `POSTGRES_PASSWORD` | PostgreSQL password                                                       | Strong password                 |
| `POSTGRES_HOST`     | PostgreSQL host (in Docker Compose, use the service name)                 | postgres                        |
| `POSTGRES_PORT`     | PostgreSQL port                                                           | 5432                            |

### Deployment Triggers

The deployment workflow is automatically triggered when:

- **Push to `main` branch** - Production deployment
- **Push to `auto-deploment` branch** - Staging/Testing deployment
- **Pull Request to `main` or `auto-deploment`** - Workflow runs but does not deploy