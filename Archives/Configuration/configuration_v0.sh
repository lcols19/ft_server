#! /bin/bash

## Variables ##
PHMYADM_INST="phpmyadmin_installation.sh"
MYSQL_CONF="mysql_configuration.sh"
SSL_CONF="ssl_configuration.sh"
INDEX_DIR="/var/www/html"
##

# Packages installation
apt-get update && apt-get install -y nginx mariadb-server php-fpm php-mysql php-json php-mbstring wordpress wget php-curl php-gd php-intl php-soap php-xml php-xmlrpc
apt-get upgrade

# PHPMyAdmin installation
rm /usr/share/phpMyAdmin/config.inc.php
chmod 755 $PHPMYADM_INST
sh $PHMYADM_INST
rm /$PHMYADM_INST

# Alterations to nginx config file
#rm /etc/nginx/nginx.conf

#rm /etc/apt/sourcs.list

chmod 755 $SSL_CONF
sh $SSL_CONF
rm /$SSL_CONF

# MySQL Configuration for Wordpress
chmod 755 $MYSQL_CONF
sh $MYSQL_CONF
rm /$MYSQL_CONF
service php7.3-fpm start

# Remove Apache2 Welcome Page
rm $INDEX_DIR/index.html
mv $INDEX_DIR/index.nginx-debian.html $INDEX_DIR/index.html

#rm /configuration.sh
