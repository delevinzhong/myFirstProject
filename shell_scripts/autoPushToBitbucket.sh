#!/bin/sh

#This is Filelist file's path
fl=/c/NotBackedUp/DevOpsjob/autoUploadToBitBucket/filelist.txt
#This is home path
hp=/c/NotBackedUp/DevOpsjob/autoUploadToBitBucket/

test -e $fl
if [ $? -eq 0 ]
then
	rm $fl
fi

for dir in $(ls /c/NotBackedUp/DevOpsjob/autoUploadToBitBucket/)
do
	#echo $dir
	[ -d $dir ] && echo $dir >>$fl
done


cat $fl | while read line
do
	cd $hp/$line
	git init
	git add --all
	git commit -m "push by git.bash"
	git remote add origin ssh://git@bitbucket.service.dev/dede/$line.git
	git push -f origin master

done
