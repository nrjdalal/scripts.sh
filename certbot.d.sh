#!/bin/bash

echo

sudo apt install snapd -y
sudo snap install core
sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot

echo

echo "Certbot installed. Add cerificates by ~ $(tput setaf 3)sudo certbot --nginx$(tput sgr0)"

echo
