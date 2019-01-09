#!/bin/bash

d=$1
RESULT='{"accepted":true}'
while [ "$d" != $2 ]; do
  DAY=$(date -d "$d" '+%d')
  MONTH=$(date -d "$d" '+%m')
  echo $d
  A=$(./restore-index.sh "logstash-2018.$MONTH.$DAY")
  while [ "${A}" != "${RESULT}" ]; do
    echo $A
    sleep 5
    A=$(./restore-index.sh "logstash-2018.$MONTH.$DAY")
  done
  d=$(date -I -d "$d + 1 day")
done
