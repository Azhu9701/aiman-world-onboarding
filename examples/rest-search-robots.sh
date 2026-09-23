#!/bin/sh
set -eu

curl -fsS -G 'https://www.aiman.world/api/robots' \
  --data-urlencode 'search=G1' \
  --data-urlencode 'pageSize=5'
printf '\n'
