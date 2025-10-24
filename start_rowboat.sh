#!/bin/bash

# Parse command line arguments
CLONE=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --clone)
            CLONE=true
            shift
            ;;
        *)
            echo "Unknown option: $1"
            echo "Usage: $0 [--clone]"
            echo "  --clone: Clone the Rowboat repository"
            exit 1
            ;;
    esac
done

# 1. Set environment variables
export PROVIDER_BASE_URL="https://openrouter.ai/api/v1"
export PROVIDER_API_KEY="sk-1234"

export PROVIDER_DEFAULT_MODEL="openai/gpt-4.1-mini"
export PROVIDER_COPILOT_MODEL="openai/gpt-4.1-mini"

# 2. Clone the repository if --clone flag is provided
if [ "$CLONE" = true ]; then
    echo "Cloning Rowboat repository..."
    git clone git@github.com:rowboatlabs/rowboat.git
fi

cd rowboat || { echo "Failed to enter rowboat directory"; exit 1; }

# 3. Start Rowboat Docker
echo "Starting Rowboat with Docker..."

export COMPOSE_FILE="docker-compose.yml:../docker-compose.override.yml"
./start.sh

echo "Rowboat started"
