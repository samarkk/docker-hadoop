FROM hshv-centos

HEALTHCHECK CMD netstat -an | grep 7077 > /dev/null; if [ 0 != $? ]; then exit 1; fi;
ENV SPARK_MASTER "spark://spark-master:7077"

RUN mkdir /swdir
ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 10002

CMD ["/run.sh"]
