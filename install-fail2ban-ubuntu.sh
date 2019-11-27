#!/bin/bash

# must root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

apt-get install fail2ban -y
sed -i '/FAIL2BAN_OPTS=\"\"/a ulimit -s 256' /etc/default/fail2ban
systemctl restart fail2ban