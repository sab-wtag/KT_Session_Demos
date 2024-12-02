#!/bin/bash

# Check if a folder name is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <folderName>"
    exit 1
fi

FOLDER_NAME=$1

# Remove all stopped containers
docker container rm -f lucee-server

# Run the Docker container
docker run \
  -it \
  -p 8080:8888 \
  --name lucee-server \
  --network host \
  -v "/Users/ahbab/CFML/KT/${FOLDER_NAME}:/var/www/" \
  -e LUCEE_ADMIN_PASSWORD=admin \
  lucee/lucee:latest