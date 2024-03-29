#!/bin/bash

echo "Welcome to acme.sh setup wizzard"

action[1]=Install
action[2]=Uninstall
action[3]=Upgrade
action[4]="Set auto upgrade"
action[5]="Disable auto upgrade"

for i in "${!action[@]}"; do echo "$i. ${action[$i]}"; done

echo -ne "Type the action above that you want to use (1 digits), followed by [ENTER]: "
read choose

case $choose in
1)

  # if curl not installed
  if ! [ -x "$(command -v curl)" ]; then
    apt-get install -y curl
    echo 'curl installed.' >&2
  fi

  echo "Do "${action[$choose]}
  curl https://get.acme.sh | sh
  ;;
2)
  echo "Do "${action[$choose]}
  $HOME/.acme.sh/acme.sh --uninstall
  ;;
3)
  echo "Do "${action[$choose]}
  $HOME/.acme.sh/acme.sh --upgrade
  ;;
4)
  echo "Do "${action[$choose]}
  $HOME/.acme.sh/acme.sh --upgrade --auto-upgrade
  ;;
5)
  echo "Do "${action[$choose]}
  $HOME/.acme.sh/acme.sh --upgrade --auto-upgrade 0
  ;;
*)
  echo "It looks like your choice is not available."
  ;;
esac