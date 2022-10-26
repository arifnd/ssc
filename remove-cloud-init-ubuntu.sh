#!/bin/bash

# must root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo 'datasource_list: [ None ]' | tee /etc/cloud/cloud.cfg.d/90_dpkg.cfg
apt remove cloud-init -y --purge
rm -rf /etc/cloud/
rm -rf /var/lib/cloud/

echo "Please reboot your system"