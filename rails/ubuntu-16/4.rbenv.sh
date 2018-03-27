#!/bin/bash

if [ ! -f ~/server_status/rbenv ]
then
    sudo apt-get update
    sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev

    RBENV_ROOT="$HOME/.rbenv"

    git clone https://github.com/rbenv/rbenv $RBENV_ROOT

    cd $RBENV_ROOT

    git clone https://github.com/rbenv/ruby-build.git $RBENV_ROOT/plugins/ruby-build
    git clone https://github.com/rkh/rbenv-whatis.git $RBENV_ROOT/plugins/rbenv-whatis
    git clone https://github.com/rkh/rbenv-use.git $RBENV_ROOT/plugins/rbenv-use

    cd $RBENV_ROOT && src/configure && make -C src

    touch ~/server_status/rbenv
fi
