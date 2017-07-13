#!/bin/bash
#
#====================================================================================
# Script Name : addVersionStatus
# Purpose : This script will call the uDeploy CLI commands to add version status in  
# 		   uDeploy's component version like "SIT Ready". After version status added,
#		   the deploy job can be continued.
# Used functions : shell commands, uDeploy CLI, Bamboo variables .
#====================================================================================


source /home/gblebdbamboodsa/.bashrc

udclient -username $bamboo_uDeploy_pub_acc -password $bamboo_uDeploy_password \
-weburl https://udeploy.service.anz:8443 \
addVersionStatus \
-version 1.143.0 \
-component Central_Logging_Repository \
-status 'SIT Ready'
