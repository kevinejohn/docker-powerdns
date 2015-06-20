# Leaner build then Ubunutu
FROM debian:jessie

MAINTAINER Kevin Johnson <kevinejohn@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -q -y pdns-server postgresql pdns-backend-pgsql && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Internally uses port 53, remap using docker
EXPOSE 53

CMD ["powerdns_run"]

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*
