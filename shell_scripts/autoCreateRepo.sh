#!/bin/bash
ssh $1 "cd $2 && git init --bare" &&
git push ssh://$1/$2
