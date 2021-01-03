FROM hshv-centos

HEALTHCHECK CMD netstat -an | grep 18080 > /dev/null; if [ 0 != $? ]; then exit 1; fi;

ADD run.sh /run.sh
RUN chmod a+x /run.sh

ENV SPARK_NO_DAEMONIZE true
#ENV SPARK_HISTORY_OPTS "-Dspark.eventLog.enabled=true -Dspark.eventLog.dir=file:///spah -Dspark.history.fs.logDirectory=file:///spah"
EXPOSE 18080

CMD ["/run.sh"]
