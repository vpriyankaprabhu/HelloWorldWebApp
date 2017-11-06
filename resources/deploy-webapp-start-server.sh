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

#copying the ear of helloworld web application to autodeploy location of domain home
cp -rf /u01/oracle/HelloWorld/resources/HelloWorldEAR.ear ${DOMAIN_HOME}/autodeploy

# Start Admin Server and tail the logs
echo "Starting WebLogic..."
${DOMAIN_HOME}/bin/startWebLogic.sh
childPID=$!
wait $childPID