#!/bin/bash
# Check if a folder name is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <folderName>"
    exit 1
fi
FOLDER_NAME=$1
# Check if a container named "lucee_server" exists
if [ $(docker ps -aq -f name=lucee_server) ]; then
    # If the container exists, check if it is running
    if [ $(docker ps -q -f name=lucee_server) ]; then
        echo "Container 'lucee_server' is already running."
    else
        echo "Starting existing container 'lucee_server'."
        docker start lucee_server
    fi
else
    # If the container does not exist, create and run a new one
    echo "Creating and running a new container 'lucee_server'."
    docker run \
      -it \
      -p 8888:8888 \
      --name lucee_server \
      -v "/Users/ahbab/CFML/KT/${FOLDER_NAME}:/var/www/" \
      -e LUCEE_ADMIN_PASSWORD=admin \
      lucee/lucee:latest
fi
docker attach lucee_server