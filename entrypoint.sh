#!/bin/bash

set -e

rm -f /app/temp/pids/server.pid

bundle exec rails db:create db:migrate

exec "$@"