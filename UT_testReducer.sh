#!/bin/bash

#Parameters
UT_PATH=/home/git/bamboo-agent-home/xml-data/build-dir/DED-DEL-JOB1/Delevin/TestCase1/python/UT
HOME_PATH=/home/git/bamboo-agent-home/xml-data/build-dir/DED-DEL-JOB1/Delevin/TestCase1/python
SOURCE_PATH=/home/git/bamboo-agent-home/xml-data/build-dir/DED-DEL-JOB1/Delevin/TestCase1/python/UT/SOURCE
OUTPUT_PATH=/home/git/bamboo-agent-home/xml-data/build-dir/DED-DEL-JOB1/Delevin/TestCase1/python/UT/OUTPUT
SAMPLE_FILE_NAME=sample_26.txt
MAPPER=mapper.py
REDUCER=reducer.py
OUTPUT_FILE=output.txt
EXPECT_OUTPUT=expectOutput.txt

cat $SOURCE_PATH/$SAMPLE_FILE_NAME | python $HOME_PATH/$MAPPER | sort | python $HOME_PATH/$REDUCER >$OUTPUT_PATH/$OUTPUT_FILE

FILE1=$OUTPUT_PATH/$OUTPUT_FILE
FILE2=$OUTPUT_PATH/$EXPECT_OUTPUT

diff $FILE1 $FILE2 >/dev/null
if [ "${?}" == "0" ]
then
        echo "Reducer Unit test success"
else
        echo "Reducer Unit test failed"
        exit 1
fi
