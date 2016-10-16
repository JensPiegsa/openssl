FROM       alpine:latest

MAINTAINER Jens Piegsa <piegsa@gmail.com>

ENV        DAYS 3650

RUN        apk add --no-cache openssl

ADD        entry.sh /

ENTRYPOINT /entry.sh
