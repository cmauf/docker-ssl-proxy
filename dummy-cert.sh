# /bin/bash -e
# Creates a dummy certificate and key to be mounted into proxy container
if [ $# -lt 1 ]; then
  echo 1>&2 "$0: missing domain to be put in dummy certificate"
  exit 2
elif [ $# -gt 1 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes -keyout key.pem -out cert.pem -subj "/CN=$1" -addext "subjectAltName=DNS:$1"
