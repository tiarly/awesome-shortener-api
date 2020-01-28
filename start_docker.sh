#!/bin/bash
echo "Starting app service"
set -ex

bundle exec rails db:create
bundle exec rails db:migrate

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle exec rails s -b 0.0.0.0
