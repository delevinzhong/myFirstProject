#!/bin/bash
#
#----------------------------------------------------------------------
#Try to use this script to change versions
#Please change the new_version parameter and update the udc_path before
#you run.
#----------------------------------------------------------------------

ucd_path=~/shell
new_version=1.151.0
addvs=addVersionStatus.sh

echo -e "\033[33mPlease make sure you have changed the version number in this script.\033[0m"

cur_version=`cat $ucd_path/$addvs | grep version | awk '{print $2}'`

echo "current version = $cur_version"
echo "new version = $new_version"

#modify single file's version
#sed -i "s/$cur_version/$new_version/g" ~/shell/1.sh
#sed -i "s/$cur_version/$new_version/g" ~/shell/2.json

#batch modify version
sed -i "s/$cur_version/$new_version/g" `grep $cur_version -rl $ucd_path`
