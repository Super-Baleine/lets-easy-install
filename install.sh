#!/bin/sh
apt-get update;sleep 1s;apt-get install git -y;sleep 1;
cd /opt/;
git clone https://github.com/letsencrypt/letsencrypt.git;sleep 1s
cd letsencrypt
service apache2 stop;service nginx stop;
read -p "Entrer le nom de domaine du site Internet : " urn
./letsencrypt-auto certonly -d www.$urn -d $urn --rsa-key-size 4096
echo "Vos certificats sont dans /etc/letsencrypt/";
service apache2 start;service nginx start;
