FROM hshv-centos

HEALTHCHECK CMD netstat -an | grep 19888 > /dev/null; if [ 0 != $? ]; then exit 1; fi;

ADD run.sh /run.sh

RUN chmod a+x /run.sh

EXPOSE 19888

CMD ["/run.sh"]
