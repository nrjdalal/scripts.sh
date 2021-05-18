#!/bin/bash

echo

sudo npm i -g pm2
pm2 startup
sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u demon --hp /home/demon
