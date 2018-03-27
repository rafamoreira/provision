#! /bin/bash

# this script assumes that you already have a "root" account with access with you main ssh key.

echo "desired username?"
read server_username

echo "server ip or hostname?"
read server_ip

ssh -l root $server_ip "adduser $server_username"

ssh -l root $server_ip "usermod -aG sudo $server_username"

ssh -l root $server_ip "echo '$server_username ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers"

ssh -l root $server_ip "su -c \"mkdir -p /home/$server_username/.ssh\" $server_username"

ssh -l root $server_ip "su -c \"touch /home/$server_username/.ssh/authorized_keys\" $server_username"

cat ~/.ssh/id_rsa.pub | ssh -l root $server_ip \ "cat >> /home/$server_username/.ssh/authorized_keys"

sshd_file="`pwd`/sshd_config"

scp $sshd_file root@$server_ip:/etc/ssh/sshd_config

ssh -l root $server_ip "systemctl restart sshd.service"

ssh -l $server_username $server_ip "mkdir -p /home/$server_username/server_status"

ssh -l $server_username $server_ip "touch /home/$server_username/server_status/1.bash.done"
