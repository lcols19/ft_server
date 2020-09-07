#!/bin/bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=BE/ST=BRUSSELS CITY/L=Brussels/O=19 Coding School/OU=Lacollar/CN=default/emailAddress=lacollar@student.s19.be"
openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
#rm /etc/nginx/sites-enabled/default
#mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
#ln -fs etc/nginx/sites-available/default /etc/nginx/sites-enabled
#service nginx start
rm /ssl_configuration.sh
