#!/bin/bash

DOMAIN_HOME=/u01/oracle/user_projects/domains/base_domain

########### SIGTERM handler ############
function _term() {
   echo "Stopping container."
   echo "SIGTERM received, shutting down the server!"
   ${DOMAIN_HOME}/bin/stopWebLogic.sh
}
########### SIGKILL handler ############
function _kill() {
   echo "SIGKILL received, shutting down the server!"
   kill -9 $childPID
}
# Set SIGTERM handler
trap _term SIGTERM
# Set SIGKILL handler
trap _kill SIGKILL

DOMAIN_HOME=/u01/oracle/user_projects/domains/base_domain
export WEBLOGI_HOME=/u01/oracle/wlserver/server/
. $WEBLOGI_HOME/bin/setWLSEnv.sh

#sh /u01/oracle/oracle_common/common/bin/wlst.sh -skipWLSModuleScanning /u01/oracle/deploy-webapp.py

# Start Admin Server and tail the logs
echo "Starting WebLogic..."
${DOMAIN_HOME}/bin/startWebLogic.sh &
childPID=$!
wait $childPID