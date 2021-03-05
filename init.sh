#!/bin/sh
# System upgrade
apt-get update
apt-get -y upgrade

# Install same base software
apt-get install -y mc aptitude curl

# Install Python for working with Ansible
apt-get install -y python3 python3-pip

exit 0