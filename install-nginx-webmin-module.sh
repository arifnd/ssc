#!/bin/bash

# must root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

apt install nginx libhtml-parser-perl -y
wget https://www.justindhoffman.com/sites/justindhoffman.com/files/nginx-0.11.wbm_.gz
tar -xf nginx-0.11.wbm_.gz
/usr/share/webmin/install-module.pl nginx-0.11.wbm_