#!/bin/bash

# must root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

apt-get update

apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

echo "deb [arch=armhf] https://download.docker.com/linux/debian buster stable" > /etc/apt/sources.list.d/docker.list

apt-get update

apt-get install docker-ce docker-ce-cli containerd.io -y