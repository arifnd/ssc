#!/bin/bash

# must root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "This script base on https://peteris.rocks/blog/can-you-kill-it/"
echo "for Ubuntu 16.04+"

apt remove dbus -y --purge
apt remove rsyslog -y --purge
apt remove acpid -y --purge
systemctl stop cron && systemctl disable cron
rm /etc/systemd/system/getty.target.wants/getty@tty1.service
rm /lib/systemd/system/getty@.service