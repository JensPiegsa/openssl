#!/bin/sh

set -e

openssl genrsa -out /certs/${KEY_NAME}.key 4096

openssl req -new -nodes -sha256 \
 -subj "/C=${DE}/ST=${STATE}/L=${LOCATION}/O=${ORGANISATION}/OU=${ORGANISATION_UNIT}/CN=${COMMON_NAME}/emailAddress=${EMAIL_ADDRESS}" \
 -key  /certs/${KEY_NAME}.key \
 -out  /certs/${KEY_NAME}.csr

if [ -z "$CA_NAME" ]; then
    openssl x509 -req -days ${DAYS} -set_serial 01 \
     -signkey ${KEY_NAME}.key \
     -in /certs/${KEY_NAME}.csr \
     -out /certs/${KEY_NAME}.pem
else
    openssl x509 -req -days ${DAYS} -set_serial 01 \
     -CA ${CA_NAME}.pem -CAkey ${CA_NAME}.key \
     -in /certs/${KEY_NAME}.csr \
     -out /certs/${KEY_NAME}.pem
fi
