#!/bin/bash

#Parameters
UT_PATH=/home/git/bamboo-agent-home/xml-data/build-dir/DED-DEL-JOB1/Delevin/TestCase1/python/UT
HOME_PATH=/home/git/bamboo-agent-home/xml-data/build-dir/DED-DEL-JOB1/Delevin/TestCase1/python
INPUT=/user/zhongd1/gutenberg/*
OUTPUT=/user/zhongd1/gutenberg-output
SAMPLE_FILE_NAME=sample_26.txt
MAPPER=mapper.py
REDUCER=reducer.py
KEYTAB_PATH=/home/git



echo "hello world  123"
#Get using hadoop commands access
kinit -kt $KEYTAB_PATH/zhongd1.keytab zhongd1
#kinit -kt /home/zhongd1/zhongd1-2.keytab zhongd1
#Remove if the output file is exist
hdfs dfs -test -e $OUTPUT

if [ $? -eq 0 ]; then
	hdfs dfs -rm -r $OUTPUT
fi


#Run the MapReduce program
hadoop jar /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/jars/hadoop-streaming-2.6.0-mr1-cdh5.8.0.jar \
        -file $HOME_PATH/$MAPPER \
        -mapper $HOME_PATH/$MAPPER \
        -file $HOME_PATH/$REDUCER \
        -reducer $HOME_PATH/$REDUCER \
        -input $INPUT \
        -output $OUTPUT
