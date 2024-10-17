#!/usr/bin/env sh

set -e

if [ -f ~/${APP_NAME}/tmp/pids/server.pid ]; then
  rm ~/${APP_NAME}/tmp/pids/server.pid
fi

bundle check || bundle install --jobs $(nproc) --retry 3

yarn check --check-files || yarn install

exec "$@"
