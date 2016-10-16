# openssl

Alpine based image with openssl for SSL certificate generation.

## Usage

* short example:

``` sh
docker volume create --name=my_certs && \
docker run --rm \
 -e "COMMON_NAME=testcert" \
 -e KEY_NAME=cert \
 -v my_certs:/certs \
 piegsaj/openssl
```
