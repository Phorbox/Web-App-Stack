#!/bin/bash
# bash makit.sh "newDns"

echo "In sed"
oldDNS = head -n 1 ./configs/oldcreds.txt
sed -i "s/$oldDNS/${1}/g" /etc/nginx/sites-available/default
sed -i "s/$oldDNS/${1}/g" ./configs/cert_ext.cnf

echo "In ssl Generation"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -config configs/cert_ext.cnf
openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

echo "nginx fixin"
service nginx reload

echo ""
echo "index: https://$oldDNS/"
"${1}" > ./configs/creds.txt
echo "dbadmin: https://$oldDNS/dbadmin"
echo ""