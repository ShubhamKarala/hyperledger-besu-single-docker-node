#!/bin/bash -u

NO_LOCK_REQUIRED=false

. ./.env
. ./.common.sh


echo "${bold}*************************************"
echo "Sample Network for Besu at ${BESU_VERSION}"
echo "*************************************${normal}"
echo "Resuming network..."
echo "----------------------------------"

docker-compose start