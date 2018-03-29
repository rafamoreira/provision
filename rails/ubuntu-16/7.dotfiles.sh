#!/bin/bash

sudo apt-get install -y zsh stow

git clone https://github.com/rafamoreira/dotfiles.git ~/dotfiles

chsh -s /bin/zsh

cd ~/dotfiles

stow emacs git ruby vim zsh.grml
