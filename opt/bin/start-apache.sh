#!/bin/sh

# Prevents "httpd (pid 1) already running" error when restarting the container
rm -f $APACHE_PID_FILE
/usr/sbin/apache2 &
tail -f /var/log/apache2/*
