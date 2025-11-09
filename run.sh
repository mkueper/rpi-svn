#!/bin/bash
#
if [ $# -ne 2 ]; then
    echo -e "\nUSAGE: run.sh your-container-name your-path \n\n"
    exit 1
fi

CONTAINER_NAME="$1"
DATA_PATH="$2"

echo -e "\ncreating container $CONTAINER_NAME\n\n"
if docker run -d -p 3690:3690 -v "$DATA_PATH":/var/svn --name "$CONTAINER_NAME" mkueper/rpi-svn; then
    echo "Container '$CONTAINER_NAME' created successfully."
else
    echo "Error: Failed to create container '$CONTAINER_NAME'."
    exit 1
fi
