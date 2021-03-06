#!/bin/bash

set -e

echo
read -p "$(tput setaf 3)Enter the project name: $(tput sgr0)" PROJECT

mkdir -p /var/www/$PROJECT.git/dev
cd /var/www/$PROJECT.git

echo
curl -o actions-runner-linux-x64-2.278.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.278.0/actions-runner-linux-x64-2.278.0.tar.gz

tar xzf ./actions-runner-linux-x64-2.278.0.tar.gz

rm ./actions-runner-linux-x64-2.278.0.tar.gz

echo
read -p "$(tput setaf 3)Would you like to configure the runner? $(tput sgr0)" ASK

if [[ $ASK == 'y' || $ASK == 'Y' ]]; then
  ./config.sh
fi

echo
read -p "$(tput setaf 3)Would you like to start the runner? $(tput sgr0)" ASK

if [[ $ASK == 'y' || $ASK == 'Y' ]]; then
  sudo ./svc.sh install
  sudo ./svc.sh start
fi

echo
