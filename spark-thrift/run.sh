#!/bin/bash


mkdir -p /sparklogs
ln -sf /dev/stdout /sparklogs/spark-thrift.out
$SPARK_HOME/bin/spark-class org.apache.spark.deploy.SparkSubmit --master spark://spark-master:7077 --class  org.apache.spark.sql.hive.thriftserver.HiveThriftServer2 spark-internal  --executor-cores 1 --executor-memory 1G --total-executor-cores 1
cat $SPARK_HOME/logs/*.out >> /sparklogs/spark-thrift.out
#$SPARK_HOME/sbin/start-history-server.sh
# $SPARK_HOME/sbin/start-thriftserver.sh