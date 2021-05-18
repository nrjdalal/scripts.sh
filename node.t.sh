#!/bin/bash

echo

read -p "Enter domain name ~ " DOMAIN
read -p "Enter proxy :port ~ " PORT

sudo mkdir /var/www/$DOMAIN

sudo cat >/var/www/$DOMAIN/index.js <<INDEX.JS
const express = require('express')
const app = express()
const PORT = $PORT

app.get('/', (req, res) => {
  res.send('The domain $DOMAIN is now active!')
})

app.listen(PORT)
INDEX.JS

cd /var/www/$DOMAIN
sudo npm i express

echo "Nodejs template created. Start by ~ $(tput setaf 3)cd /var/www/$DOMAIN && node index.js$(tput sgr0)"

unset DOMAIN
unset PORT

echo
