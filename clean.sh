#!/usr/bin/env bash

while true; do
  echo "cleaning"
  find /data/ -mmin +1 -exec rm {} \;
  echo "sleeping"
  sleep 10
done
