FROM node:11-alpine
MAINTAINER Rodrigo Pinheiro Matias

ARG BUILD_DATE=0

LABEL author.name "Rodrigo Pinheiro Matias"
LABEL author.email "rodrigopmatias@gmail.com"
LABEL build.date ${BUILD_DATE}

RUN apk update && \
    apk add git sqlite && \
    yarn global add sqlite3 @angular/cli create-react-app @vue/cli @vue/cli-init @adonisjs/cli
