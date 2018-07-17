#!/bin/sh

REPO="https://github.com/rodrigopmatias/django-sample.git"

echo -e "clonning repository \033[1m\033[4m${REPO}\033[0m ..." && \
/usr/bin/git clone ${REPO} src
/app/env/bin/pip install -Ur /app/src/requeriments.txt
