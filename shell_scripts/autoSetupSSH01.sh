#!/bin/bash

#validate whether you have installed ssh client.
cd
ssh -V
if [ $? -eq 0 ]; then
echo -e "\033[33mYou have already installed SSH client\033[0m"
else
echo -e "\033[31mError: you haven't install SSH client, please install it first!\033[0m"
exit 1
fi

#validate whether you already have .ssh folder and id_rsa, id_rsa.pub files.
ls -al ~/.ssh
if [ $? -eq 0 ]; then
echo -e "\033[33mYou already have ~/.ssh folder.\033[0m"
	ls -l ~/.ssh >~/temp.txt
	cat ~/temp.txt | while read line
	do
		grep id_rsa
		if [ $? -eq 0 ];then
			echo -e "\033[33mYou already have id_rsa and id_rsa.pub files, please copy to Bitbucket directly.\033[0m" 
		else
			echo -e "\033[31mWarning:You don't have id_rsa file, auto delete .ssh file.\033[0m"
			echo -e "\033[33mPlease re-run this script to carry on.\033[0m"
			rm -rf ~/.ssh
		fi
	done
exit
else 
echo -e "\033[33mYou don't have ~/.ssh folder, will create it.\033[0m"
fi
rm ~/temp.txt

#create ssh folder
echo -e "\033[33mPlease set the path and your ssh password or just press Enter\033[0m"
ssh-keygen

#validate whether you have created the id_rsa and id_rsa.pub files
ls -l ~/.ssh >~/temp.txt
cat ~/temp.txt | while read line
do
	grep id_rsa
	if [ $? -eq 0 ]; then
	echo -e "\033[33mid_rsa and id_rsa.pub files created successfully.\033[0m"
	fi
done
rm ~/temp.txt

#create config file 
echo -e "\033[33mcreate config file...\033[0m"
cd ~/.ssh
echo "Host bitbucket.service.anz" >config
echo " IdentityFile ~/.ssh/id_rsa" >>config
cat ~/.ssh/config
if [ $? -eq 0 ]; then
echo -e "\033[33mconfig file created successfully\033[0m"
else 
echo -e "\033[31mError: config file created failed\033[0m"
fi

echo -e "\033[33mPlease restart Git Bash and run Step_2.sh\033[0m"
