#!/bin/bash

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -gt 0 ] || die "At least 1 argument required, $# provided"

for b in $*; do 
  echo $b: $(for i in $(curl -sS -X GET http://127.0.0.1:10018/buckets/${b}/keys?keys=stream | sed -e 's/keys//g; s/[:"{}]//g; s/,/ /g; s/\[/ /g; s/\]/ /g;' ); do
    echo $i
  done | wc -l)
done
