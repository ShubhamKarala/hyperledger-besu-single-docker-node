#!/bin/sh

bold=$(tput bold)
normal=$(tput sgr0)

if [ "${NO_LOCK_REQUIRED}" = "true" ];then
  if [ -f ${LOCK_FILE} ];then
    echo "Network already in use (${LOCK_FILE} present)." >&2
    echo "Restart with ./resume.sh or remove with ./remove.sh before running again." >&2
    exit 1
  fi
else
  version=$BESU_VERSION
  composeFile=""
  if [ -f ${LOCK_FILE} ]; then
    #read the first line of the lock file and store the value as it's the compose file option
    composeFile=`sed '1q;d' ${LOCK_FILE}`
    #read the second line of the lock file and store the value as it's images version
    version=`sed '2q;d' ${LOCK_FILE}`
  else
    echo "Network is not running (${LOCK_FILE} not present)." >&2
    echo "Run it with ./run.sh first" >&2
    exit 1
  fi
fi