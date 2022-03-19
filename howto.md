# Fantastic Instructions
[https://gist.github.com/Soarez/9688998](https://gist.github.com/Soarez/9688998)


# RTFM
[https://www.openssl.org/docs/manmaster/man7/](https://www.openssl.org/docs/manmaster/man7/)


# Create a Proper CSR

openssl req \
    -new \
    -newkey rsa:2048 \
    -keyout <keyfile.key> \
    -days <#days> \
    -config <configfile.conf> \
    -extensions <extsection> \
    -verbose \
    -sha256 \
    -nodes \
    -utf8 \
    -outform pem \
    -out <out.csr>

openssl x509 \
    -in <request.csr> \
    -sha256 \
    -out <cert.pem> \
    -outform pem \
    -CA <ca.crt> \
    -CAcreateserial \
    -CAform pem \
    -CAkey <ca.key> \
    -CAkeyform pem \
    -days 730 \
    -extensions <extsection> \
    -extfile <extfile.ext> \
    -req
