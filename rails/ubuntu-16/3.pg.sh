#!/bin/bash

if [ ! -f ~/server_status/pg ]
then
    sudo apt-get update
    sudo apt-get install -y postgresql postgresql-contrib 
    touch ~/server_status/pg
fi
