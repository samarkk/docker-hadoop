#!/bin/bash

if hdfs dfs -test -e /spah 
then
echo "spark application history directory exists"
else
echo "creating spark application history directory"
hdfs dfs -mkdir /spah
hdfs dfs -chmod -R 1777 /spah
fi

mkdir -p /sparklogs
echo "echoing spark history opts"
echo $SPARK_HISTORY_OPTS
ln -sf /dev/stdout /sparklogs/spark-history.out
/opt/spark/bin/spark-class  org.apache.spark.deploy.history.HistoryServer
cat $SPARK_HOME/logs/*.out >> /sparklogs/spark-history.out
# $SPARK_HOME/sbin/start-history-server.sh