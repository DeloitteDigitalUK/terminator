#!/bin/sh

sed -i'' \
    -e s/@CERT_FILE@/${CERT_FILE}/g \
    -e s/@BACKEND_HOST@/${BACKEND_HOST}/g \
    -e s/@BACKEND_PORT@/${BACKEND_PORT}/g \
    /usr/local/etc/haproxy/haproxy.cfg

exec haproxy -f /usr/local/etc/haproxy/haproxy.cfg
