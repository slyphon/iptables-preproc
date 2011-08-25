#!/bin/bash

PROGNAME=$0
PROGARGS=$@

preprocess() {
  local infile=$1
  local tmp="$(mktemp $1.XXXXXXXX)"


  gcc -E -nostdinc -x c -o- $1
}


if [[ $# -lt 1 ]]; then
  echo "Usage: $(basename $0) inputfile.sh" >&2
  exit 1
else
  preprocess $1
fi

