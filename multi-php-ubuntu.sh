#!/bin/bash

# must root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "Add ppa:ondrej/php by Ondřej Surý"

apt-get install software-properties-common -y
add-apt-repository ppa:ondrej/php
apt-get update