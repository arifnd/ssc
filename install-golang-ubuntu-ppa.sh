#!/bin/bash

# must root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root." 
  exit 1
fi

add-apt-repository ppa:longsleep/golang-backports
apt-get update
apt-get install -y golang-go