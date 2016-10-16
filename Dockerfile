FROM       alpine:latest

MAINTAINER Jens Piegsa <piegsa@gmail.com>

ENV        RUNTIME_PACKAGES openssl

ENV        DAYS 3650

RUN        apt-get update && \
           apt-get install -y $RUNTIME_PACKAGES --no-install-recommends && \
           apt-get clean -qq && \
           rm -rf /var/lib/apt/lists/* 

ADD        entry.sh /

ENTRYPOINT /entry.sh
