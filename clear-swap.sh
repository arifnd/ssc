#!/bin/bash

# must root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# disable swap
echo -ne "Disable swap..."
swapoff -a
echo "[DONE]"

# sleep 5 seconds
sleep 5

# enable swap
echo -ne "Enable swap..."
swapon -a
echo "[DONE]"