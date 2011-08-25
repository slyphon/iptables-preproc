#!/bin/bash

PROGNAME=$0
PROGARGS=$@


if [[ $# -lt 1 ]]; then
  echo "Usage: $(basename $0) inputfile.sh" >&2
  exit 1
else
  gcc -E -x c -o- $1
fi

