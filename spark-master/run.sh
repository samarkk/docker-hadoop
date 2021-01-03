#!/bin/bash

mkdir -p /sparklogs
ln -sf /dev/stdout /sparklogs/spark-master.out
$SPARK_HOME/bin/spark-class  org.apache.spark.deploy.master.Master 
cat $SPARK_HOME/logs/*.out >> /sparklogs/spark-master.out
