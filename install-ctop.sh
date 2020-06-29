#!/bin/bash

# must root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

TAG=$(curl --silent "https://api.github.com/repos/bcicen/ctop/releases/latest" |
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/')
VERSION=$(curl --silent "https://api.github.com/repos/bcicen/ctop/releases/latest" |
    grep -m1 '"name":' |
    sed -E 's/.*"([^"]+)".*/\1/')

wget https://github.com/bcicen/ctop/releases/download/$TAG/ctop-$VERSION-linux-amd64 -O /usr/local/bin/ctop
chmod +x /usr/local/bin/ctop