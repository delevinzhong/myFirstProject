#!/bin/bash 
#
#====================================================================================
# Script Name : deploy_to_DEV
# Purpose : This script will using uDeploy CLI commandes to auto import version to 
#		    uDeploy component. After the version imported, it will run the Applicaton
#		    process automatically to deploy codes to DEV server. 
# Used functions : shell script, uDeploy CLI, Bamboo variables
#
#====================================================================================


source /home/gblebdbamboodsa/.bashrc

#import version
echo "Import version"
udclient -username $bamboo_uDeploy_pub_acc -password $bamboo_uDeploy_password \
-weburl https://udeploy.service.anz:8443 \
importVersions ${bamboo.build.working.directory}/uDeploy/importVersion.json

sleep 30

#run application
echo "Run application"
udclient -username $bamboo_uDeploy_pub_acc -password $bamboo_uDeploy_password \
-weburl https://udeploy.service.anz:8443 \
requestApplicationProcess ${bamboo.build.working.directory}/uDeploy/runDevAppProcess.json
