#!/bin/bash -eu

NO_LOCK_REQUIRED=false

. ./.env
. ./.common.sh

HOST=${DOCKER_PORT_2375_TCP_ADDR:-"localhost"}

# Displays links to exposed services
echo "${bold}*************************************"
echo "Sample Network for Besu at ${BESU_VERSION}"
echo "*************************************${normal}"
echo "List endpoints and services"
echo "----------------------------------"

# Displays services list with port mapping
docker-compose ps
dots=""
maxRetryCount=50


echo "****************************************************************"
echo "JSON-RPC HTTP service endpoint      : http://${HOST}:8545"
echo "JSON-RPC WebSocket service endpoint : ws://${HOST}:8546"
echo "GraphQL HTTP service endpoint       : http://${HOST}:8547"
echo "Web block explorer address          : http://${HOST}:8080/"
echo "****************************************************************"

