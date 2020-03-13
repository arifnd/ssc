#!/bin/bash

# must root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
fi

echo -ne "Installing depedency..."
apt install nginx libhtml-parser-perl -yqq
echo "[DONE]"

# if file not exist
if [[ ! -f "nginx-0.11.wbm_" ]]; then
    echo -ne "Downloading..."
    wget -q https://www.justindhoffman.com/sites/justindhoffman.com/files/nginx-0.11.wbm_.gz
    echo "[DONE]"

    echo -ne "Extracting..."
    gunzip nginx-0.11.wbm_.gz
    echo "[DONE]"
fi

echo -ne "Installing..."
/usr/share/webmin/install-module.pl nginx-0.11.wbm_
echo "[DONE]"