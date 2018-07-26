FROM node:9-alpine
MAINTAINER Rodrigo Pinheiro Matias

ARG BUILD_DATE=0

LABEL author.name "Rodrigo Pinheiro Matias"
LABEL author.email "rodrigopmatias@gmail.com"
LABEL build.date ${BUILD_DATE}

RUN apk update && \
    apk add git && \
    yarn global add @angular/cli create-react-app
