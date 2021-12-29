# docker-ssl-proxy

Builds a basic nginx server that proxies incoming SSL calls to a target host
(usually another Docker container). This repository adds proxying a backend directory.

## Environment variables

The following environment variables configure nginx:

- ``SERVER_NAME``: name of the server (default value: ``www.example.com``)
- ``TARGET_SCHEME``: target scheme for the reverse proxy (default value: ``http``)
- ``TARGET_PORT``: target port for the reverse proxy (default value: ``80``)
- ``TARGET_HOST``: target host for the reverse proxy (default value: ``proxyapp``)
- ``TARGET_HOST_HEADER``: value to be used as the Host header when sending
  requests to the target host (defaults to the value of ``$TARGET_HOST``)
- ``CLIENT_MAX_BODY_SIZE``: maximum size of client uploads (default value: ``20M``)
- ``SSL_PORT``: port ngnix SSL proxy listens on
- ``API_SCHEME``: target scheme for the backend reverse proxy (default value: ``http``)
- ``API_PORT``: target port for the backend reverse proxy (default value: ``3001``)
- ``API_HOST``: target host for the backend reverse proxy (default value: ``proxyapi``)
- ``API_HOST_HEADER``: value to be used as the Host header when sending
  requests to the target host (defaults to the value of ``$API_HOST``)

## Using own Certificate

You have to use certificates, otherwise the build will fail. Do so
by connecting an volume onto ``/etc/nginx/certs`` with following files inside:

- ``key.pem``: private key file
- ``cert.pem``: certificate file


## Logging

The container is set to log to ``/var/log/nginx``. You can mount a volume to analyse
the logs.
