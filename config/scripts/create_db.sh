#!/bin/bash

check_koop_db () {
  # Grab a list of databases
  check_db="$(psql -h postgis -U postgres -lqt)"

  # Check to see if $KOOP_DATABASE already exists
  if grep -q -Eoq "($KOOP_DATABASE)" <<< $check_db; then
    echo "Database $KOOP_DATABASE has already been created... skipping."
  else
    # Create the koop PostGIS database
    psql -h postgis -U postgres -c "CREATE DATABASE $KOOP_DATABASE TEMPLATE template_postgis;"
  fi
}
