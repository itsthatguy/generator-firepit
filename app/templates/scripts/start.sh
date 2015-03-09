#!/usr/bin/env sh

source .env;
echo "[NODE_ENV] ${NODE_ENV}";

if [[ $NODE_ENV == 'development' ]]; then
  gulp server;
else
  coffee lib/webserver.coffee --start;
fi
