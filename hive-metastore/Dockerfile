FROM hshv-centos

HEALTHCHECK CMD netstat -an | grep 9083 > /dev/null; if [ 0 != $? ]; then exit 1; fi;

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9083

CMD ["/run.sh"]