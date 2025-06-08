#!/bin/bash

# Set variables
COMPOSE_FILE_PATH="/var/lib/docker/volumes/portainer_data/_data/compose/3/docker-compose.yml"  # Update this path
STACK_NAME="torrenting-stack"

# Navigate to the directory containing the docker-compose.yml file
cd "$(dirname "$COMPOSE_FILE_PATH")"

# Pull the latest images for all services
docker-compose -f "$COMPOSE_FILE_PATH" pull

# Recreate the containers with the latest images
docker-compose -f "$COMPOSE_FILE_PATH" up -d --force-recreate

# Optional: Clean up unused images
docker image prune -f
