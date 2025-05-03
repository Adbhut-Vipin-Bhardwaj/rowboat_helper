#!/bin/bash

# Navigate to the rowboat directory
if [ -d "rowboat" ]; then
    cd rowboat || { echo "Failed to enter rowboat directory"; exit 1; }

    # Stop Docker containers
    echo "Stopping Rowboat Docker containers..."

    export COMPOSE_FILE="docker-compose.yml:../docker-compose.override.yml"
    docker compose down

    echo "Rowboat stopped."
else
    echo "Rowboat directory does not exist. Nothing to stop."
fi
