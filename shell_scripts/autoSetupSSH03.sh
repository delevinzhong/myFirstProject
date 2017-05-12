#!/bin/bash

#Verify that the script identity added your identity successfully by querying the SSH agent
ssh-add -l
if [ $? -eq 0 ]; then
echo -e "\033[33mYour identity added successfully\033[0m"
fi

echo -e "\033[33mPlease copy the contents of id_rsa.pub to Bitbucket\033[0m"
