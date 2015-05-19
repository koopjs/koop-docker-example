#!/bin/sh

set -e

KOOP_DATABASE=${KOOP_DATABASE:-koopdev}

if [ "$1" = 'koop' ]; then

  check_db=`psql -h postgis -U postgres -lqt | grep -Eo "($KOOP_DATABASE)"`

  if [ -z ${check_db+x} ] && [ "$KOOP_DATABASE" = "$check_db" ]; then
    echo "Database $KOOP_DATABASE has already been created... skipping."
  else
    psql -h postgis -U postgres -c "CREATE DATABASE $KOOP_DATABASE TEMPLATE template_postgis;"
  fi

  cd /usr/src/koop
  exec node server.js
fi

exec "$@"
