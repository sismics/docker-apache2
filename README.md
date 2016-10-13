# docker-apache2
Dockerfile for Apache Web Server

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
