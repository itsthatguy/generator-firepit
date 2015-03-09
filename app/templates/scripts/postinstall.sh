#!/usr/bin/env sh

source .env;
if [[ $NODE_ENV == 'development' ]]; then
  bower install;
  gulp;
fi
