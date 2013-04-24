#!/bin/bash

BUCKET='zombie_search'
RIAKHOST='127.0.0.1:10018'

export PATH=$PATH:/Users/dnorthrup/bin

# Extract keys from JSON crap
for i in $(curl -sS -X GET http://${RIAKHOST}/buckets/${BUCKET}/keys?keys=stream | sed -e 's/keys//g; s/[:"{}]//g; s/,/ /g; s/\[/ /g; s/\]//g;' ); do 
  echo "====== Working on ${i} ======" 
  curl -v -X GET http://${RIAKHOST}/buckets/${BUCKET}/keys/$i 2>&1 | grep '< HTTP'
  curl -v -X DELETE http://${RIAKHOST}/buckets/${BUCKET}/keys/$i 2>&1 | grep '< HTTP'
  curl -v -X GET http://${RIAKHOST}/buckets/${BUCKET}/keys/$i 2>&1 | grep '< HTTP'
#  sleep 2
done
