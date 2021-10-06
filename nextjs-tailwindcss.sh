#!/bin/bash

yarn create next-app -e with-tailwindcss .

if grep -Fxq "yarn.lock" .gitignore; then
else
  echo "yarn.lock" >>.gitignore
fi
