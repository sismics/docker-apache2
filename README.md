[![GitHub release](https://img.shields.io/github/release/sismics/docker-apache2.svg?style=flat-square)](https://github.com/sismics/docker-backupninja/releases/latest)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## About
Docker image for Apache Web Server

## Usage

Make a new Dockerfile that extends from this image:
```
FROM sismics/apache2:latest
```

Add your documents to the web root:

```
RUN rm -fr /var/www/html/*
ADD www /var/www/html
```

Start a container:

```
docker run -d -h apache2 --name apache2 -p 80:80 --restart=always \
    sismics/apache2
```
