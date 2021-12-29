FROM alpine:3.15.0
MAINTAINER Constantin Mauf-Clausen

ENV SSL_PORT=443

RUN apk add --no-cache nginx openssl gettext

ADD check_cert.sh /
ADD nginx.conf.template /
ADD configure_and_start.sh /

EXPOSE ${SSL_PORT}

ENTRYPOINT ["/configure_and_start.sh"]
