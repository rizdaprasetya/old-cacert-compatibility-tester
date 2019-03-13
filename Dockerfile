# Reference img: https://github.com/ellerbrock/docker-collection/tree/master/dockerfiles/alpine-curl-ssl

FROM alpine:3.8

RUN \
  apk add --no-cache \
    curl \
    dumb-init \
    openssl

COPY ./. .