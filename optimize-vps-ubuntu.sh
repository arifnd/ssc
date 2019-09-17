#!/bin/bash

# must root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "This script base on https://peteris.rocks/blog/can-you-kill-it/"
echo "for Ubuntu 16.04+"

apt remove lvm2 -y --purge
apt remove at -y --purge
apt remove snapd -y --purge
apt remove lxcfs -y --purge
apt remove mdadm -y --purge
apt remove open-iscsi -y --purge
apt remove accountsservice -y --purge
apt remove policykit-1 -y --purge