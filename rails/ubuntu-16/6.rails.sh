#!/bin/bash

echo "rails version? "
read railsv

gem install bundler
gem install rails -v $railsv
