FROM hshv-centos

HEALTHCHECK CMD netstat -an | grep 10002 > /dev/null; if [ 0 != $? ]; then exit 1; fi;

EXPOSE 10000 10002
ADD run.sh /run.sh
RUN chmod a+x /run.sh
CMD ["/run.sh"]
