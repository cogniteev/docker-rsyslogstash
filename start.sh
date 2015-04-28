#!/bin/bash

# Execute rest of the command if first argument is '--'
# example: docker run --rm -ti cogniteev/rsyslogstash -- bash
if [ "x$1" = "x--" ] ;then
    shift
    exec $@
fi

# Check for linked logstash with syslog input container
# and set LOGSTASH url based on host & port
if [[ "$LOGSTASH_PORT_514_TCP_ADDR" != "" ]]; then
    LOGSTASH=$LOGSTASH_PORT_514_TCP_ADDR:$LOGSTASH_PORT_514_TCP_PORT
fi

export LOGSTASH=${LOGSTASH:-localhost:514}

sed -e "s/LOGSTASH/${LOGSTASH}/" \
    /etc/rsyslog.d/02-logstash-fwd.conf.in \
    > /etc/rsyslog.d/02-logstash-fwd.conf

exec rsyslogd -n
