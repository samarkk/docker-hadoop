# build the base container 
# currently adding everything here, hadoop, spark, hive
FROM centos:7

RUN yum clean all; \
    rpm --rebuilddb; \
    yum install -y wget which tar sudo tree openssh-server openssh-clients rsync java-1.8.0-openjdk-devel.x86_64 perl net-tools python3 bindutils nc mlocate

ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0

RUN curl -O https://downloads.apache.org/hadoop/common/KEYS

RUN curl -O https://dist.apache.org/repos/dist/release/hadoop/common/KEYS

RUN gpg --import KEYS

ENV SPARK_VERSION=3.0.1
ENV SHV=3.2
ENV HIVE_VERSION=3.1.2
ENV HADOOP_VERSION 3.3.0
ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    && gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz* 

RUN set -x && wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${SHV}.tgz \
    && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${SHV}.tgz -C /opt/ \
    && rm spark-${SPARK_VERSION}-bin-hadoop${SHV}.tgz 

RUN set -x && wget https://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz && \
	tar -xzvf apache-hive-$HIVE_VERSION-bin.tar.gz -C /opt \
    && rm apache-hive-$HIVE_VERSION-bin.tar.gz 

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop

RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

RUN mkdir /hadoop-data

RUN ln -s /opt/apache-hive-$HIVE_VERSION-bin /opt/hive
RUN ln -s /opt/spark-${SPARK_VERSION}-bin-hadoop${SHV} /opt/spark

ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV SPARK_HOME=/opt/spark
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV HIVE_HOME=/opt/hive
ENV PATH $HADOOP_HOME/bin/:$SPARK_HOME/bin:$HIVE_HOME/bin:/$PATH

RUN wget https://jdbc.postgresql.org/download/postgresql-9.4.1212.jar -O $HIVE_HOME/lib/postgresql-jdbc.jar

RUN  rm /opt/apache-hive-3.1.2-bin/lib/guava-19.0.jar &&  cp /opt/hadoop-3.3.0/share/hadoop/hdfs/lib/guava-27.0-jre.jar /opt/apache-hive-3.1.2-bin/lib

ADD conf/hive-site.xml ${HIVE_HOME}/conf
ADD conf/beeline-log4j2.properties ${HIVE_HOME}/conf
ADD conf/hive-env.sh ${HIVE_HOME}/conf
ADD conf/spark-defaults.conf ${SPARK_HOME}/conf
RUN ln -s ${HIVE_HOME}/conf/hive-site.xml $SPARK_HOME/conf/hive-site.xml
ADD entrypoint.sh /entrypoint.sh

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /opt/spark/logs

RUN mkdir /spah
RUN chmod 777 /spah
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
