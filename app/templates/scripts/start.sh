#!/usr/bin/env sh

source .env;
echo "[NODE_ENV] ${NODE_ENV}";

if [[ $NODE_ENV == 'development' ]]; then
  $(npm bin)/gulp server;
else
  $(npm bin)/coffee lib/webserver.coffee --start;
fi
