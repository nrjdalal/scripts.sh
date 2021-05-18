#!/bin/bash

flag=false
while [ $flag != true ]; do
  echo
  read -p "Username: " USERNAME
  adduser $USERNAME --disabled-login --gecos GECOS >/dev/null
  if [ $? == 0 ]; then
    flag=true
  fi
done

flag=false
while [ $flag != true ]; do
  echo
  passwd $USERNAME >/dev/null
  if [ $? == 0 ]; then
    flag=true
  fi
done

usermod -aG sudo $USERNAME

echo
tput setaf 3
echo "su - $USERNAME"
tput sgr0
unset USERNAME

echo
