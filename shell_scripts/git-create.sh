#!/bin/bash
# 
# create a new empty remote repository.
#
# Usage: git-create <remote-url>
#
if [ -z "$1" ]
then
	echo "Usage: $0 <remote-url>"
	echo
	exit 1
fi


#parse url in host and repository path
HOST=`echo $1 | tr ':' ' ' | cut -d' ' -f1`
REPO=`echo $1 | tr ':' ' ' | cut -d' ' -f2`

#append .git, if not already
if [ ! `echo $REPO | grep -e '.git$'` ]
then
	REPO=$REPO.git
fi

echo "Create Repository $REPO at $HOST"
if [ "$2" == "-i" ]
then
   echo -n "? (y/n) "
	read r
	if [ $r == "n" ]; then exit 0; fi
fi


REMOTE_CMD="mkdir -p $REPO && git init --bare $REPO"
ssh $HOST $REMOTE_CMD
if [ $? -eq 0 ]
then
  echo "Add content by pushing to the repository:"
  echo
  echo "git remote add origin $HOST:$REPO"
  echo "git push -u origin master"
  echo
else
  echo "Creating repository failed."
fi
