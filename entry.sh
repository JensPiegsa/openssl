#!/bin/sh

set -e

openssl genrsa -out /certs/${KEY_NAME}.key 4096

if [ -z "${EMAIL_ADDRESS}" ]; then
    openssl req -new -nodes -sha256 \
     -subj "/C=${COUNTRY}/ST=${STATE}/L=${LOCATION}/O=${ORGANISATION}/OU=${ORGANISATION_UNIT}/CN=${COMMON_NAME}" \
     -key  /certs/${KEY_NAME}.key \
     -out  /certs/${KEY_NAME}.csr
else
    openssl req -new -nodes -sha256 \
     -subj "/C=${COUNTRY}/ST=${STATE}/L=${LOCATION}/O=${ORGANISATION}/OU=${ORGANISATION_UNIT}/CN=${COMMON_NAME}/emailAddress=${EMAIL_ADDRESS}" \
     -key  /certs/${KEY_NAME}.key \
     -out  /certs/${KEY_NAME}.csr
fi

if [ -z "${CA_NAME}" ]; then
    openssl x509 -req -days ${DAYS} -set_serial 01 \
     -signkey /certs/${KEY_NAME}.key \
     -in /certs/${KEY_NAME}.csr \
     -out /certs/${KEY_NAME}.pem
else
    openssl x509 -req -days ${DAYS} -set_serial 01 \
     -CA /certs/${CA_NAME}.pem -CAkey /certs/${CA_NAME}.key \
     -in /certs/${KEY_NAME}.csr \
     -out /certs/${KEY_NAME}.pem
fi
