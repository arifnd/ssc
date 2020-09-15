#!/bin/bash

# must root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

VERSION=4.4

apt-get install gnupg wget -y

wget -qO - https://www.mongodb.org/static/pgp/server-$VERSION.asc | apt-key add -

echo "deb [arch=amd64] https://repo.mongodb.org/apt/ubuntu  $(lsb_release -cs)/mongodb-org/$VERSION multiverse" | tee /etc/apt/sources.list.d/mongodb.list

sudo apt-get update

sudo apt-get install mongodb-org -y