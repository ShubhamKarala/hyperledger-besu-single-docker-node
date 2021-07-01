#!/bin/bash -u

NO_LOCK_REQUIRED=false

. ./.env
. ./.common.sh


echo "${bold}*************************************"
echo "Sample Network for Besu at ${BESU_VERSION}"
echo "*************************************${normal}"
echo "Stop and remove network..."
docker-compose docker-compose.yml down -v
docker-compose docker-compose.yml rm -sfv

docker image rm network/besu:${BESU_VERSION}
docker image rm 4757/besu-explorer:latest

rm ${LOCK_FILE}
echo "Lock file ${LOCK_FILE} removed"