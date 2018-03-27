#!/bin/bash

if [ -f ~/server_status/rbenv ]
then
    echo "ruby version: "
    read rubyv

    rbenv install $rubyv --verbose

    echo "global? (y or n)"
    read rubyglobal

    if [ $rubyglobal=="y" ]
    then
        rbenv global $rubyv
    fi

    rbenv rehash
fi
