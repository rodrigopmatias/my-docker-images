#!/bin/bash

B='\033[1m'
RST='\033[0m'

G="\033[32m"
R="\033[31m"
Y="${B}\033[33m"

DONE="${B}${G}done${RST}"
ERR="${B}${R}failure${RST}"

scan() {
  echo -e "scaning directory ${B}${1}${RST} ... "

  if [ -f "${1}/Dockerfile" ]; then
    tagname=$(cat "${1}/tag.txt")

    if [[ ! -z "$tagname" ]]; then
      echo -en "  building image with tag ${Y}${tagname}${RST} ... "
      docker build --build-arg BUILD_DATE=${BUILD_DATE} -t ${tagname} ${1} 1>&2 1> ${1}/log.txt

      if [ "$?" -eq "0" ]; then
        echo -e "${DONE}"
      else
        echo -e "${ERR}"
      fi

      if [ -f "${1}/aliases.txt" ]; then
        echo -e "  making aliases: "
        for tagalias in $(cat "${1}/aliases.txt"); do
          echo -e "    \u03ff ${Y}${tagalias}${RST}"
          docker tag ${tagname} ${tagalias} 1>&2 1>> ${1}/log.txt
        done
      fi
    else
      echo "tag name file not found, create tag.txt with tag name."
    fi
  else
    for path in $(ls $1); do
      if [ -d "${1}/${path}" ]; then
        scan "${1}/${path}"
      fi
    done
  fi
}

if [ -z "$BUILD_DATE" ]; then
  BUILD_DATE=$(date +%Y%m%d%H%M%s)
fi

echo -e "build date at ${B}${G}${BUILD_DATE}${RST} ..."
if [ "$#" -eq "0" ]; then
  scan ${PWD}
else
  while [[ ! -z "$@" ]]; do
    scan $1
    shift 1
  done
fi
