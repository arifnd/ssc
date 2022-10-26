
# must root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

apt-get update

apt-get install rrdtool perl libwww-perl libmailtools-perl libmime-lite-perl librrds-perl libdbi-perl libxml-simple-perl libhttp-server-simple-perl libconfig-general-perl libio-socket-ssl-perl

wget https://www.monitorix.org/monitorix_3.12.0-izzy1_all.deb

dpkg -i monitorix*.deb

apt-get -f install
