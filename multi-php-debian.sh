#!/bin/bash

# must root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# if curl not installed
if ! [ -x "$(command -v curl)" ]; then
  apt-get install -y curl
  echo 'curl installed.' >&2
fi

curl -sSL https://packages.sury.org/php/README.txt | bash -x
apt update