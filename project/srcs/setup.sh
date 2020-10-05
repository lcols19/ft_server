#! /bin/bash

# Back to Home Directory
cd

### Packages Installation ####
apt-get update -y && apt-get upgrade -y && apt-get install -qq nginx \
wget curl vim \
php-{json,mbstring,curl,gd,intl,fpm,soap,xml,xmlrpc,zip} mariadb-server
apt-get install -qq php-mysql
##############################


### LEMP Installation ######################
# # Database System Installation #####
service mysql start
# # Nginx Configuration for PHP ########
mkdir /var/www/my_website
mkdir /var/www/my_website/html
chown -R $USER:$USER /var/www/my_website
# creation of my_website
rm /etc/nginx/sites-*/default
ln -s /etc/nginx/sites-available/my_website /etc/nginx/sites-enabled/
# # PHP Test #####
# creation info.php
# mv info.php to /var/www/my_website/html/
mv /tmp/info.php /var/www/my_website/html/
service php7.3-fpm start
# check if it's working
# rm info.php
############################################

### Self-Signed SSL Certificate Creation ###############
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
/etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=BE/ST=BRUSSELS CITY/L=Brussels/O=19 Coding School/OU=Lacollar/CN=172.17.0.2/emailAddress=lacollar@student.s19.be"
openssl dhparam -out /etc/nginx/dhparam.pem 2048
# creation self-signed.conf
# creation ssl-params
# creation my_website.bak
# creation my_website
service nginx start
# ######################################################

### PHPMyAdmin Installation #################
wget -P /var/www/my_website/html \
https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
tar -xzvf /var/www/my_website/html/phpMyAdmin-latest-all-languages.tar.gz \
--directory /var/www/my_website/html/
rm /var/www/my_website/html/phpMyAdmin-*.tar.gz
mv /var/www/my_website/html/phpMyAdmin-* /var/www/my_website/html/phpMyAdmin
# creation config.inc.php
# mv config.inc.php to /var/www/my_website/html/phpMyAdmin
mv /tmp/config.inc.php /var/www/my_website/html/phpMyAdmin/
mysql < /var/www/my_website/html/phpMyAdmin/sql/create_tables.sql -u root
mysql -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'lauretta'@'localhost' IDENTIFIED BY 'collard'"
mysql -e "FLUSH PRIVILEGES"
# creation phpMyAdmin.conf
ln -s /etc/nginx/sites-available/phpMyAdmin.conf /etc/nginx/sites-enabled/
mkdir /var/www/my_website/html/phpMyAdmin/tmp
chmod 777 /var/www/my_website/html/phpMyAdmin/tmp
chown -R www-data:www-data /var/www/my_website/html/phpMyAdmin
service nginx restart && service php7.3-fpm restart
# mysql -e "CREATE DATABASE app_db"
mysql -e "CREATE DATABASE app_db DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci"
mysql -e "GRANT ALL PRIVILEGES ON app_db.* TO 'lauretta'@'localhost' IDENTIFIED BY 'collard'"
mysql -e "FLUSH PRIVILEGES"
# ###########################################


### Wordpress Installation ###########
# mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci"
# mysql -e "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password'"
# mysql -e "FLUSH PRIVILEGES"
service php7.3-fpm restart
# creation wordpress
cd /tmp && curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
rm latest.tar.gz
# creation wp-config.php
mkdir /var/www/my_website/html/wordpress/
cp -a /tmp/wordpress/. /var/www/my_website/html/wordpress/
chown -R www-data:www-data /var/www/my_website/html/wordpress/
rm -rf /tmp/wordpress/
# ####################################

rm /tmp/setup.sh