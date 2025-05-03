#!/bin/bash

# 1. Set environment variables
export PROVIDER_BASE_URL="https://openrouter.ai/api/v1"
export PROVIDER_API_KEY="sk-1234"

export PROVIDER_DEFAULT_MODEL="openai/gpt-4.1-nano"
export PROVIDER_COPILOT_MODEL="openai/gpt-4.1-nano"

# 2. Clone the repository if it doesn't exist
if [ ! -d "rowboat" ]; then
    echo "Cloning Rowboat repository..."
    git clone git@github.com:rowboatlabs/rowboat.git
fi

cd rowboat || { echo "Failed to enter rowboat directory"; exit 1; }

# 3. Start Rowboat Docker
echo "Starting Rowboat with Docker..."

export COMPOSE_FILE="docker-compose.yml:../docker-compose.override.yml"
docker compose up --build

echo "Rowboat started"
