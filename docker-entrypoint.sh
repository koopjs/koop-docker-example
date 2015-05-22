#!/bin/bash

set -e

# PostgreSQL database name for koop
KOOP_DATABASE=${KOOP_DATABASE:-koopdev}

if [ "$1" = 'koop' ]; then
  if [ "$2" = 'postgis' ]; then
    # Create the database
    . $APP_DIR/config/scripts/create_db.sh
    check_koop_db
  fi

  cd $APP_DIR
  echo "Starting the koop server..."
  exec node server.js
fi

exec "$@"
