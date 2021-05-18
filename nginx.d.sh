#!/bin/bash

if [[ $(id -u) -ne 0 ]]; then
  echo
  echo "Please Use ~ $(tput setaf 3)sudo nginxGen$(tput sgr0)"
  echo
  exit 1
fi

echo

read -p "Enter domain name ~ " DOMAIN
read -p "Enter proxy :port ~ " PORT

sudo cat >/etc/nginx/sites-available/$DOMAIN.conf <<CONF
server {
    listen 80;
    listen [::]:80;
    server_name $DOMAIN www.$DOMAIN;

    location / {
        proxy_pass http://127.0.0.1:$PORT;
    }
}
CONF

sudo ln -s /etc/nginx/sites-available/$DOMAIN.conf /etc/nginx/sites-enabled/$DOMAIN.conf
sudo nginx -t && sudo nginx -s reload

echo "Config created. Verify by ~ $(tput setaf 3)sudo nano /etc/nginx/sites-enabled/$DOMAIN.conf$(tput sgr0)"

unset DOMAIN
unset PORT

echo
