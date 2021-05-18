#!/bin/bash

read -p "Username - " UNAME
read -ps "Password - " UPASS

adduser $UNAME >/dev/null 2>/dev/null <<_INPUT_
$UPASS
$UPASS





y
_INPUT_
unset UPASS

usermod -aG sudo $UNAME

echo
echo "Run the command given below to switch user -"
tput setaf 3
echo "su - $UNAME"
tput sgr0
unset UNAME
