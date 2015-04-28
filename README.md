## $(rsyslog 8 | logstash) Dockerfile

Forward logs to [Logstash](http://logstash.net/) or any syslog server.

This repository contains **Dockerfile** of the latest version of [Rsyslog 8](http://www.rsyslog.com/) configured to push logs to [Logstash](http://logstash.net/) for [Docker](https://www.docker.com/) [automated build](https://registry.hub.docker.com/u/cogniteev/rsyslogstash/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

### Base Docker Image

* [cogniteev/rsyslog8:latest](https://registry.hub.docker.com/u/cogniteev/rsyslog8/)

### Installation

1. Install [Docker](https://www.docker.com/)

2. Download [automated build](https://registry.hub.docker.com/u/cogniteev/rsyslog8/): `docker pull cogniteev/rsyslogstash`

### Provides a /var/log/containers volume

This image forwards to a syslog server *.log* files available in `/var/log/containers` directory.

It is recommended to create a `/var/log/containers` data-only container, mount this volume on every application containers and make sure they write their log files in this directory.

### Provides a syslog upstream server

#### link to a syslog container

You can link a logstash container (configured with a syslog input listening on port 514).
Make sure to name the logstash container `logstash`.

Example:

   ```shell
   $ sudo docker run -d -l logstash-container:logstash cogniteev/rsyslogstash
   ```

### Specify LOGSTASH environment variable

You can also specify the `LOGSTASH` environment variable providing syslog server address:

   ```shell
$ sudo docker run -d -e LOGSTASH=1.2.3.4:514 cogniteev/rsyslogstash
   ```

### Example

Check the [sample application](https://github.com/cogniteev/docker-rsyslogstash/tree/master/sample) using docker-compose. 2 containers are emitting logs in `/var/log/containers` volume, read by a `cogniteev/rsyslogstash` container forwarding them to a `logstash` container, which is emitting received messages to its standard output.

    docker-compose up

Wait a few seconds, and you will see logstash containers emitting logs pushed by application containers.

### License

The `cogniteev/rsyslogstash` image is licensed under the Apache License, Version 2.0. See LICENSE for full license text.
