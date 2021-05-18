#!/bin/bash

flag=false
while [ $flag != true ]; do
  echo
  read -p "Username: " USERNAME
  sudo adduser $USERNAME --disabled-login --gecos GECOS >/dev/null
  if [ $? == 0 ]; then
    flag=true
  fi
done

flag=false
while [ $flag != true ]; do
  echo
  sudo passwd $USERNAME >/dev/null
  if [ $? == 0 ]; then
    flag=true
  fi
done

sudo usermod -aG sudo $USERNAME

echo

tput setaf 3
echo "su - $USERNAME"
tput sgr0
unset USERNAME

sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl reload sshd

echo
