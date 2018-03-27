#!/bin/bash

if [ ! -f ~/server_status/nginx ]
then
    sudo apt-get update
    sudo apt-get install -y curl git-core nginx

    touch ~/server_status/nginx
fi
