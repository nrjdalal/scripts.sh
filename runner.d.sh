#!/bin/bash

set -e

read -p "enter the project name: " PROJECT

mkdir -p /var/www/$PROJECT.git/dev
cd /var/www/$PROJECT.git

curl -o actions-runner-linux-x64-2.278.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.278.0/actions-runner-linux-x64-2.278.0.tar.gz

tar xzf ./actions-runner-linux-x64-2.278.0.tar.gz

rm ./actions-runner-linux-x64-2.278.0.tar.gz

read -p "would you like to configure the runner: " ASK

if [[ $ASK == 'y' || $ASK == 'Y' ]]; then
  ./configure.sh
fi