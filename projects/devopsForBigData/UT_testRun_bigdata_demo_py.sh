#!/bin/bash

#Parameters
UT_PATH=/tmp/Testcase1/demo-of-big-data/TestCase1/python/UT
HOME_PATH=/tmp/Testcase1/demo-of-big-data/TestCase1/python
INPUT=/user/zhongd1/source/*
OUTPUT=/user/zhongd1/source-output
SAMPLE_FILE_NAME=sample_26.txt
MAPPER=mapper.py
REDUCER=reducer.py
KEYTAB_PATH=/tmp/Testcase1

#Get using hadoop commands access
kinit -kt $KEYTAB_PATH/zhongd1-2.keytab zhongd1

#Remove if the output file is exist
hdfs dfs -test -e $OUTPUT

if [ $? -eq 0 ]; then
	hdfs dfs -rm -r $OUTPUT
fi


#Run the test MapReduce program
hadoop jar /opt/cloudera/parcels/CDH-5.8.0-1.cdh5.8.0.p0.42/jars/hadoop-streaming-2.6.0-mr1-cdh5.8.0.jar \
        -file $HOME_PATH/$MAPPER \
        -mapper $HOME_PATH/$MAPPER \
        -file $HOME_PATH/$REDUCER \
        -reducer $HOME_PATH/$REDUCER \
        -input $INPUT \
        -output $OUTPUT
