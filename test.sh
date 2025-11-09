#!/bin/bash

# Exit on error
set -e

# Build the image
./build.sh

# Run the container
CONTAINER_NAME="test-svn-container"
DATA_PATH="$(pwd)/test-svn-data"
mkdir -p "$DATA_PATH"
./run.sh "$CONTAINER_NAME" "$DATA_PATH"

# Create a test repository
REPO_NAME="test-repo"
docker exec -it "$CONTAINER_NAME" svnadmin create "/var/svn/$REPO_NAME"

# Check if the repository was created
if [ -d "$DATA_PATH/$REPO_NAME" ]; then
    echo "Test repository created successfully."
else
    echo "Error: Failed to create test repository."
    docker rm -f "$CONTAINER_NAME"
    rm -rf "$DATA_PATH"
    exit 1
fi

# Stop and remove the container
docker rm -f "$CONTAINER_NAME"

# Clean up test data
rm -rf "$DATA_PATH"

echo "Test completed successfully."
