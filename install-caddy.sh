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

echo -ne "Installing depedency..."
apt-get install debian-keyring debian-archive-keyring apt-transport-https -yqq
echo "[DONE]"

echo -ne "Installing keys..."
if [[ ! -f "/usr/share/keyrings/caddy-stable-archive-keyring.gpg" ]]; then
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg > /dev/null
fi

if [[ ! -f "/etc/apt/sources.list.d/caddy-stable.list" ]]; then
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list > /dev/null
fi
echo "[DONE]"

echo -ne "Update package lists..."
apt-get update > /dev/null
echo "[DONE]"

echo -ne "Installing caddy..."
apt-get install caddy -yqq
echo "[DONE]"
