#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /blog/tmp/pids/server.pid

# Create database and apply migrations
rails db:prepare

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
