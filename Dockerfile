FROM cogniteev/rsyslog8
MAINTAINER Cogniteev <tech@cogniteev.com>

ADD start.sh /usr/bin/

ENTRYPOINT /usr/bin/start.sh
CMD </etc/rsyslog.d/02-logstash-fwd.in.conf \
    sed \
    -e "s/@LOGSTASH_SERVER@/$LOGSTASH_SERVER/" \
    -e "s/@LOGSTASH_PORT@/$LOGSTASH_PORT/" \
    >> /etc/rsyslog.conf && rsyslogd -n
