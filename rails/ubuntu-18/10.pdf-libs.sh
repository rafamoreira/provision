#!/bin/bash

if [ ! -f ~/server_status/pdflibs ]
then
    sudo apt-get update
    sudo apt-get install -y libxrender1-

    touch ~/server_status/pdflibs
fi
