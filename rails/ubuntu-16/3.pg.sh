#!/bin/bash

if [ ! -f ~/server_status/pg ]
then
    sudo apt-get update
    sudo apt-get install -y postgresql postgresql-contrib

    echo "PG USER?"
    read PGUSER

    echo "PGPASS"
    read PGPASS
    
    sudo -u postgres bash -c "psql -c \"CREATE USER $PGUSER WITH PASSWORD '$PGPASS';\""
    sudo -u postgres bash -c "psql -c \"ALTER USER $PGUSER CREATEDB;\""
    
    touch ~/server_status/pg
fi
