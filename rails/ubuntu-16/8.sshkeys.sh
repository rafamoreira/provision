#!/bin/bash

echo "comment: "
read comment

ssh-keygen -t rsa -b 4096 -C "$comment"

cat ~/.ssh/id_rsa.pub
