FROM python:3.6-alpine

ARG BUILD_DATE=0

LABEL   author Rodrigo Pinheiro Matias
LABEL   email rodrigopmatias@gmail.com
LABEL   build.date ${BUILD_DATE}

RUN mkdir /app && \
    adduser -h /app -s /bin/sh -D -H -u 1000 user && \
    chown 1000:1000 /app && \
    apk update && \
    apk add git

USER user

RUN pyvenv /app/env

WORKDIR /app

ONBUILD COPY install.sh install.sh
ONBUILD RUN /bin/sh /app/install.sh
