#!/bin/bash

mkdir -p /sparklogs
ln -sf /dev/stdout /sparklogs/spark-worker.out
$SPARK_HOME/bin/spark-class  org.apache.spark.deploy.worker.Worker spark://spark-master:7077 --cores 2 --memory 2G
cat $SPARK_HOME/logs/*.out >> /sparklogs/spark-worker.out
