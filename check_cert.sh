#!/bin/sh -e
OUTPUT_DIR=/etc/nginx/certs

mkdir -p $OUTPUT_DIR

if [ ! -f ${OUTPUT_DIR}/key.pem ]; then
  echo "no certificate given! aborting..."
  exit 10
fi
