#!/bin/bash

#validate whether the ~/.bashrc file exist
test -e ~/.bashrc
if [ $? -eq 0 ]; then
echo -e "\033[33m.bashrc file exist.\033[0m"
else 
echo -e "\033[31m.bashrc file doesn't exist, going to create it...\033[0m"
echo "
SSH_ENV=\$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
	echo \"Initializing new SSH agent...\"
	# spawn ssh-agent
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' > \"\${SSH_ENV}\"
	echo succeeded
	chmod 600 \"\${SSH_ENV}\"
	. \"\${SSH_ENV}\" > /dev/null
	/usr/bin/ssh-add
}

if [ -f \"\${SSH_ENV}\" ]; then
	. \"\${SSH_ENV}\" > /dev/null
	ps -ef | grep \${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
		start_agent;
	}
else
	start_agent;
fi" >~/.bashrc
#validate whether the ./bashrc file created successfully
test -e ~/.bashrc
if [ $? -eq 0 ]; then
echo -e "\033[33m.bashrc file created successfully\033[0m"
else
echo -e "\033[31m.bashrc file created failed\033[0m"
fi
fi

echo -e "\033[33mPlease restart GitBash then run step_3.sh\033[0m"
