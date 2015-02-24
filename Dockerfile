FROM cogniteev/rsyslog8
MAINTAINER Cogniteev <tech@cogniteev.com>

ENV LOGSTASH_SERVER=127.0.0.1
ENV LOGSTASH_PORT=10514

ADD etc/rsyslog.d/* /etc/rsyslog.d/
ADD etc/rsyslog.conf.append /tmp/

CMD </tmp/rsyslog.conf.append \
    sed \
    -e "s/@LOGSTASH_SERVER@/$LOGSTASH_SERVER/" \
    -e "s/@LOGSTASH_PORT@/$LOGSTASH_PORT/" \
    >> /etc/rsyslog.conf && rsyslogd -n -D -d
