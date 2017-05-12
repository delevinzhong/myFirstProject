#!/bin/bash

#Parameters
UT_PATH=/home/git/bamboo-agent-home/xml-data/build-dir/DED-DEL-JOB1/Delevin/TestCase1/python/UT
SOURCE_PATH=/home/git/bamboo-agent-home/xml-data/build-dir/DED-DEL-JOB1/Delevin/TestCase1/python/UT/SOURCE
OUTPUT_PATH=/home/git/bamboo-agent-home/xml-data/build-dir/DED-DEL-JOB1/Delevin/TestCase1/python/UT/OUTPUT
HOME_PATH=/home/git/bamboo-agent-home/xml-data/build-dir/DED-DEL-JOB1/Delevin/TestCase1/python
SAMPLE_FILE_NAME=sample_26.txt
MAPPER=mapper.py


returnCount=`cat $SOURCE_PATH/$SAMPLE_FILE_NAME | python $HOME_PATH/$MAPPER | awk 'END{print NR}'`
echo "Checking file name is: $SAMPLE_FILE_NAME"
echo "returnCount=$returnCount"
expectFile=`ls $SOURCE_PATH/$SAMPLE_FILE_NAME`
expectString=`echo $expectFile | cut -d. -f1`
expectCount=`echo $expectString | cut -d'_' -f2`
echo "expectCount=$expectCount"

if [ "$returnCount" == "$expectCount" ]
then
        echo "Mapper Unit test success"
else
        echo "Mapper Unit test failed"
        exit 1
fi
