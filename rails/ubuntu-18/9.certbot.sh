#!/bin/bash

sudo add-apt-repository ppa:certbot/certbot

sudo apt-get update -y

sudo apt-get install python-certbot-nginx
