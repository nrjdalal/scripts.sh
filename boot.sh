#!/bin/bash

sudo apt update
sudo apt upgrade -y

apt install nginx -y

curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install nodejs -y
sudo apt install build-essential -y
