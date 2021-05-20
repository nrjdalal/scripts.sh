#!/bin/bash

echo

sudo apt update
sudo apt upgrade -y

sudo apt install nginx -y

curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install nodejs -y

sudo apt autoremove -y

echo
