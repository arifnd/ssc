#!/bin/bash

# must root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# if wget or apt-key not installed
if ! [ -x "$(command -v curl)" ]; then
  echo 'Error: curl is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v apt-key)" ]; then
  echo 'Error: apt-key is not installed.' >&2
  exit 1
fi

echo -ne "Add webmin repo..."
echo "deb https://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list
echo " [DONE]"

echo -ne "Download webmin key..."
wget http://www.webmin.com/jcameron-key.asc
echo " [DONE]"

echo -ne "Add webmin key..."
apt-key add jcameron-key.asc
echo " [DONE]"

apt-get install apt-transport-https -y
apt-get update
apt-get install webmin -y