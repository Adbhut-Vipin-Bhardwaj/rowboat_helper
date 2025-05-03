# Rowboat Setup scripts

This project has Rowboat setup scripts.

## Prerequisites

- Docker and Docker Compose
- Git
- Bash shell

## Starting rowboat
```bash
./start_rowboat.sh
```

This script will:
- Set up necessary environment variables
- Clone the Rowboat repository if it doesn't exist
- Start the Docker container

## Shutting down rowboat

To stop the container:
```bash
./stop_rowboat.sh
```

## Configuration

The project uses a custom Docker Compose override file (`docker-compose.override.yml`) that adds host gateway configurations for all services.

## Environment Variables

The following environment variables are set in `start_rowboat.sh`:
- `PROVIDER_BASE_URL`
- `PROVIDER_API_KEY`
- `PROVIDER_DEFAULT_MODEL`: Default model for the agent
- `PROVIDER_COPILOT_MODEL`: Model used for copilot functionality
