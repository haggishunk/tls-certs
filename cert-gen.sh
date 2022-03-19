#!/bin/env bash

# This script generates a CSR and signs a
# server certificate using a locally available CA.

export DIRCA=$1
export DIRCERT=$2

openssl req \
    -new \
    -newkey rsa:2048 \
    -keyout "$DIRCERT/tls.key" \
    -days 730 \
    -config "$DIRCERT/tls.conf" \
    -extensions x509_extensions \
    -verbose \
    -sha256 \
    -nodes \
    -utf8 \
    -outform pem \
    -out "$DIRCERT/tls.csr"

openssl x509 \
    -in "$DIRCERT/tls.csr" \
    -sha256 \
    -out "$DIRCERT/tls.crt" \
    -outform pem \
    -CA "$DIRCA/ca.crt" \
    -CAcreateserial \
    -CAform pem \
    -CAkey "$DIRCA/ca.key" \
    -CAkeyform pem \
    -days 730 \
    -extensions x509_extensions \
    -extfile "$DIRCERT/tls.conf" \
    -req
