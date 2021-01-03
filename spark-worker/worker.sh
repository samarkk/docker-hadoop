#!/bin/bash

. "/spark/sbin/spark-config.sh"

. "/spark/bin/load-spark-env.sh"

mkdir -p $SPARK_WORKER_LOG

export SPARK_HOME=/opt/spark

ln -sf /dev/stdout $SPARK_WORKER_LOG/spark-worker.out

/opt/spark/sbin/../bin/spark-class org.apache.spark.deploy.worker.Worker \
    --webui-port $SPARK_WORKER_WEBUI_PORT $SPARK_MASTER --cores 2 --memory 2G >> $SPARK_WORKER_LOG/spark-worker.out