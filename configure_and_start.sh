#!/bin/sh -e

export SERVER_NAME=${SERVER_NAME:-localhost}
export TARGET_SCHEME=${TARGET_SCHEME:-http}
export TARGET_PORT=${TARGET_PORT:-80}
export TARGET_HOST=${TARGET_HOST:-proxyapp}
export TARGET_HOST_HEADER=${TARGET_HOST_HEADER:-${TARGET_HOST}}
export CLIENT_MAX_BODY_SIZE=${CLIENT_MAX_BODY_SIZE:-20M}
export SSL_PORT=${SSL_PORT:-443}
export API_SCHEME=${API_SCHEME:-http}
export API_HOST=${API_HOST:-proxyapi}
export API_PORT=${API_PORT:-3001}
export API_ROOT=${API_ROOT:-/api}
export API_HOST_HEADER=${API_HOST_HEADER:-${API_HOST}}

REPLACEABLE='$SERVER_NAME:$TARGET_SCHEME:$TARGET_PORT:$TARGET_HOST:$TARGET_HOST_HEADER:$CLIENT_MAX_BODY_SIZE:$SSL_PORT:$API_SCHEME:$API_HOST:$API_PORT:$API_ROOT:$API_HOST_HEADER'

envsubst $REPLACEABLE </nginx.conf.template >/etc/nginx/nginx.conf

/check_cert.sh

# Use exec so nginx can get signals directly
exec nginx
