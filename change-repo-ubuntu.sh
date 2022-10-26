#!/bin/bash

# must root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root." 
  exit 1
fi

# if cat or lsb_release not installed
if ! [ -x "$(command -v cat)" ]; then
  echo 'Error: cat is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v lsb_release)" ]; then
  echo 'Error: lsb_release is not installed.' >&2
  exit 1
fi

change_repository () {
mv /etc/apt/sources.list /etc/apt/sources.list.bak
cat >> /etc/apt/sources.list <<EOF
deb http://$1/ubuntu/ $2 main restricted
deb http://$1/ubuntu/ $2-updates main restricted
deb http://$1/ubuntu/ $2 universe
deb http://$1/ubuntu/ $2-updates universe
deb http://$1/ubuntu/ $2 multiverse
deb http://$1/ubuntu/ $2-updates multiverse
deb http://$1/ubuntu/ $2-backports main restricted universe multiverse
deb http://$1/ubuntu/ $2-security main restricted
deb http://$1/ubuntu/ $2-security universe
deb http://$1/ubuntu/ $2-security multiverse
EOF
}

repo[1]=kambing.ui.ac.id
repo[2]=kartolo.sby.datautama.net.id
repo[3]=kebo.pens.ac.id
repo[4]=buaya.klas.or.id
repo[5]=mirror.unej.ac.id
repo[6]=mirror.cloud.id
repo[7]=mirror.kavalinux.com
repo[8]=mirror.omadata.com
repo[9]=suro.ubaya.ac.id

for i in "${!repo[@]}"; do echo "$i. ${repo[$i]}"; done

echo -ne "Type the repository that you want to use (1 digits), followed by [ENTER]: "
read choose

case $choose in
[1-9])
  echo ${repo[$choose]} "used."
  change_repository ${repo[$choose]} $(lsb_release -c -s)
  ;;
*)
  echo "It looks like your choice is not available..."
  ;;
esac