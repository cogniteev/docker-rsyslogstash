## $(rsyslog 8 | logstash) Dockerfile

Forward rsyslog logs to [Logstash](http://logstash.net/)

This repository contains **Dockerfile** of the latest version of [Rsyslog 8](http://www.rsyslog.com/) configured to push logs to [Logstash](http://logstash.net/) for [Docker](https://www.docker.com/) [automated build](https://registry.hub.docker.com/u/cogniteev/rsyslogstash/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

### Base Docker Image

* [cogniteev/rsyslog8](https://registry.hub.docker.com/u/cogniteev/rsyslog8/)

### Installation

1. Install [Docker](https://www.docker.com/)

2. Download [automated build](https://registry.hub.docker.com/u/cogniteev/rsyslog8/): `docker pull cogniteev/rsyslogstash`

### Usage

Images has 2 environment variables you can specify when starting the container:
* `LOGSTASH_SERVER`: Specifies the target Logstash server. **Must be specified when starting the container.** 
* `LOGSTASH_PORT`: Specifies the port where Logstash server is listening.[Default=10514]

Example:

   ```shell
   $ sudo docker run -d -e LOGSTASH_SERVER=thot.acme.org cogniteev/rsyslogstash
   ```

This image takes benefits of its [parent image](https://registry.hub.docker.com/u/cogniteev/rsyslog8), meaning that you can easily forward your containers logs with the `--volumes-from` directives. Please take a look at the [sample docker-compose application](https://github.com/cogniteev/docker-rsyslog8/tree/master/sample) for a *real* usage
