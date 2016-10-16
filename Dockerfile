FROM       alpine:latest

MAINTAINER Jens Piegsa <piegsa@gmail.com>

ENV        DAYS 3650

RUN        apk add --no-cache openssl

COPY       entry.sh /entry.sh

ENTRYPOINT ["/entry.sh"]
