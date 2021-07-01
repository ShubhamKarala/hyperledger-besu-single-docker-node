#!/bin/bash -u

NO_LOCK_REQUIRED=false

. ./.env
. ./.common.sh


echo "${bold}*************************************"
echo "Sample Network for Besu at ${BESU_VERSION}"
echo "*************************************${normal}"
echo "Stop and remove network..."
docker-compose down -v
docker-compose rm -sfv

docker image rm network/besu:${BESU_VERSION}
docker image rm 4757/besu-explorer:latest

rm ${LOCK_FILE}
echo "Lock file ${LOCK_FILE} removed"