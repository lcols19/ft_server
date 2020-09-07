#!/bin/bash

wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages /usr/share/phpMyAdmin
#rm /usr/share/phpMyAdmin/config.inc.php
mv /tmp/config.inc.php /usr/share/phpMyAdmin/config.inc.php
cp -pr /usr/share/phpMyAdmin/config.sample.inc.php /usr/share/phpMyAdmin/config.inc.php

service nginx start
service mysql start


mysql < /usr/share/phpMyAdmin/sql/create_tables.sql
mysql -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'password'"
mysql -e "FLUSH PRIVILEGES"

mkdir /usr/share/phpMyAdmin/tmp
chmod 777 /usr/share/phpMyAdmin/tmp
chown -R www-data:www-data /usr/share/phpMyAdmin
service nginx start && service php7.3-fpm start
rm /phpMyAdmin-4.9.0.1-all-languages.tar.gz

rm phpmyadmin_installation.sh
