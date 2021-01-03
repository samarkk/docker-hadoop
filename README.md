# docker-hadoop
Create a full fledged hadoop single node cluster using the definitions here

### you can use the build_images.txt file to have the images with the changes built automatically
### just set the DOBASEDIR variable to the base directory where you will store the docker files
### is has two formats for working with windows command prompt or wsl2 or any shell in a linux machine
### for building the postgresql image required for hive metastore running in postgresql clone the docker-hive-metastore-postgresql reposigory and issue the command
### docker build -t psql-hm .
### you can start everything by issuing
### docker-compose up -d
### first time when you start the cluster, - you can create the required hdfs directories as follows
### docker container exec namenode hdfs dfs -mkdir -p /user/root
### docker container exec namenode hdfs dfs -mkdir /tmp
### docker container exec namenode hdfs dfs -mkdir /spah
### the following service start on the cluser
### namenode
### datanode
### resourcemanager
### nodemanager
### jobhistoryserver
### hive-metastore
### hiveserver2
### spark-master
### spark-worker
### Run your spark jobs using the spark-master container and you will have the web ui available at port 4040
### you can run spark-shell, spark-submit, spark-sql as follows
### docker container exec -it spark-master spark-shell -
### supply the spark arguments to use either of local, spark standalone cluster manager - spark://spark-master:7077 or yarn and subsequently as per the cluster manager any other arguments needed

### save for resource manager web ui not navigating ahead everything should work smoothly


