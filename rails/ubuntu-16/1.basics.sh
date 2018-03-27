#! /bin/bash

# this script assumes that you already have a "root" account with access with you main ssh key.

echo "desired username?"
read server_username

echo "server ip or hostname?"
read server_ip


ssh -l root $server_ip "adduser $server_username"
ssh -l root $server_ip "usermod -aG sudo $server_username"
ssh -l root $server_ip "echo '$server_username ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers"
