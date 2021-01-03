FROM hshv-centos

HEALTHCHECK CMD netstat -an | grep 8081 > /dev/null; if [ 0 != $? ]; then exit 1; fi;

COPY worker.sh /

ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_LOG /opt/spark/logs
ENV SPARK_MASTER "spark://spark-master:7077"

EXPOSE 8081

CMD ["/bin/bash", "/worker.sh"]

#ADD run.sh /run.sh
#RUN chmod a+x /run.sh

#EXPOSE 8081

#CMD ["/run.sh"]
