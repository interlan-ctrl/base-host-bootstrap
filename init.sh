#!/bin/sh
# System upgrade
apt-get update
apt-get -y upgrade

# Install same base software
apt-get install -y mc aptitude curl

# Install Python for working with Ansible
apt-get install -y python3 python3-pip

# Create Ansible user with auth by key
useradd ansible
mkdir /home/ansible/
mkdir /home/ansible/.ssh/
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDke/THYxcwPEWBzN8mtf4BTXMhvVWXZcfVX144+qEGjb9Vxs6deWki38x51jf+tSCCQurkkqOlfLj+J2uOEP31wGos0BlPtCgB3fKawBIAeXoB9WwS0d5IyIKJfHY5PGFX5gJqa4LttnRyiKZskUg36upPcRsG+IlaOiQqN5yz2u2ZEf5ELj3yViWPBBCClPWBxJ+RTiS5f6PAhEtR4Fd7D/AuGypoPSj4Kf4b7NSg2XvoOtdQximpKoX0f8OQ3PUxDcbQw6K+rrGsoIzHzWl0KZBFJQ92Eni4NizDkwr7K7WTJRp6waAo7ad3FjLqeWMnpuFZDCikfMKZ1YH0HzrYg7csz75OtpsEFrrN6abWIGQeiw0jp44yEpSl/4j5Yl+0xDCUJmBMcEqpf3NR0jlsWD7Chs8soYo9Jyh54JcsrWCZWncqglOvpcnF9UnK3OPmh51jSKtQJYHeqkCbSMAWYTl65sAt6znypBFypaZlDWfmnDi+CXujvz5BoOkxTs= chernousov@sms-wks-208" > /home/ansible/.ssh/authorized_keys
chown -R ansible:ansible /home/ansible/
chmod 400 /home/ansible/.ssh/authorized_keys

# Разрешаем этому пользователю делать все
echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible

exit 0