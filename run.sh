#!/bin/bash -u

NO_LOCK_REQUIRED=true

. ./.env
. ./.common.sh

# Build and run containers and network
echo "docker-compose.yml" > ${LOCK_FILE}
echo "${BESU_VERSION}" >> ${LOCK_FILE}

echo "${bold}*************************************"
echo "Sample Network for Besu at ${BESU_VERSION}"
echo "*************************************${normal}"
echo "Start network"
echo "--------------------"

echo "Starting network..."
docker-compose docker-compose.yml build --pull
docker-compose docker-compose.yml up --detach

#list services and endpoints
./list.sh