#
# Dockerfile for Apache Web Server
#

FROM ubuntu:focal
MAINTAINER Jean-Marc Tremeaux <jm.tremeaux@sismics.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y apache2 curl unzip && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN mkdir -p /var/lock/apache2
COPY opt /opt
COPY etc /etc

RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/
RUN ln -s /etc/apache2/mods-available/remoteip.load /etc/apache2/mods-enabled/

EXPOSE 80 443

CMD ["/opt/bin/start-apache.sh"]
