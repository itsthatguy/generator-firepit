#!/usr/bin/env sh

source .env;
if [[ $NODE_ENV == 'development' ]]; then
  $(npm bin)/bower install;
  $(npm bin)/gulp;
fi
