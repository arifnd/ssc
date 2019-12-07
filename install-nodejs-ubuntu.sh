#!/bin/sh

# must root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root." 
  exit 1
fi

ver[1]=13.x
ver[2]=12.x
ver[3]=11.x
ver[4]=10.x
ver[5]=8.x

for i in "${!ver[@]}"; do echo "$i. ${ver[$i]}"; done

echo -ne "Type the nodejs version that you want to install (1 digits), followed by [ENTER]: "
read choose

case $choose in
[1-5])
  echo "install nodejs v"${ver[$choose]}
  curl -sL https://deb.nodesource.com/setup_${ver[$choose]} | bash -
  apt-get install -y nodejs
  ;;
*)
  echo "It looks like your choice is not available..."
  ;;
esac
