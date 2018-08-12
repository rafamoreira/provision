#!/bin/bash

sudo apt-get update
sudo apt-get install -y nodejs

echo "rails version? "
read railsv

gem install bundler
gem install rails -v $railsv
