FROM haproxy:1.6

VOLUME /etc/ssl/private
ENV CERT_FILE haproxy.pem
ENV BACKEND_HOST backend
ENV BACKEND_PORT 80

EXPOSE 80 443

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY start.sh /usr/local/bin/start_haproxy

CMD ["start_haproxy"]
