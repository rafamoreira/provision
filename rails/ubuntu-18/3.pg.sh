#!/bin/bash

echo "create db? (y or n)"
read isdb

if [ $isdb=="y" ]
then
    echo "db name: "
    read dbname
    echo "dbuser: "
    read dbuser

    sudo -u postgres bash -c "psql -c \"create database $dbname;\""
    sudo -u postgres bash -c "psql -c \"grant all privileges on database $dbname to $dbuser;\""
else
    if [ ! -f ~/server_status/pg ]
    then
        sudo apt-get update
        sudo apt-get install -y postgresql postgresql-contrib libpq-dev

        echo "PG USER?"
        read PGUSER

        echo "PGPASS"
        read PGPASS

        sudo -u postgres bash -c "psql -c \"CREATE USER $PGUSER WITH PASSWORD '$PGPASS';\""
        sudo -u postgres bash -c "psql -c \"ALTER USER $PGUSER CREATEDB;\""

        touch ~/server_status/pg
    fi
fi
