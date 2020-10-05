#! /bin/bash

# Back to Home Directory
cd

### Packages Installation ####
apt-get update -y && apt-get upgrade -y && apt-get install -qq nginx \
wget curl vim \
php-{json,mbstring,curl,gd,intl,fpm,soap,xml,xmlrpc,zip,mysql} mariadb-server
##############################


### LEMP Installation ######################
# # Nginx Configuration for PHP ########
mkdir /var/www/my_website
mkdir /var/www/my_website/html
chown -R $USER:$USER /var/www/my_website
rm /etc/nginx/sites-*/default
ln -s /etc/nginx/sites-available/my_website /etc/nginx/sites-enabled/
# # PHP Test #####
mv /tmp/info.php /var/www/my_website/html/
service php7.3-fpm start
############################################

### Self-Signed SSL Certificate Creation ###############
service mysql start
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
/etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=BE/ST=BRUSSELS CITY/L=Brussels/O=19 Coding School/OU=Lacollar/CN=172.17.0.2/emailAddress=lacollar@student.s19.be"
openssl dhparam -out /etc/nginx/dhparam.pem 2048
service nginx start
# ######################################################

### PHPMyAdmin Installation #################
wget -P /var/www/my_website/html \
https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
tar -xzvf /var/www/my_website/html/phpMyAdmin-latest-all-languages.tar.gz \
--directory /var/www/my_website/html/
rm /var/www/my_website/html/phpMyAdmin-*.tar.gz
mv /var/www/my_website/html/phpMyAdmin-* /var/www/my_website/html/phpMyAdmin
mv /tmp/config.inc.php /var/www/my_website/html/phpMyAdmin/
mysql < /var/www/my_website/html/phpMyAdmin/sql/create_tables.sql -u root
mysql -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'lauretta'@'localhost' IDENTIFIED BY 'collard'"
mysql -e "FLUSH PRIVILEGES"
ln -s /etc/nginx/sites-available/phpMyAdmin.conf /etc/nginx/sites-enabled/
mkdir /var/www/my_website/html/phpMyAdmin/tmp
chmod 777 /var/www/my_website/html/phpMyAdmin/tmp
chown -R www-data:www-data /var/www/my_website/html/phpMyAdmin
service nginx restart && service php7.3-fpm restart
mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'lauretta'@'localhost' IDENTIFIED BY 'collard'"
mysql -e "FLUSH PRIVILEGES"
# ###########################################


### Wordpress Installation ###########
service php7.3-fpm restart
cd /tmp && curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
rm latest.tar.gz
mkdir /var/www/my_website/html/wordpress/
cp -a /tmp/wordpress/. /var/www/my_website/html/wordpress/
chown -R www-data:www-data /var/www/my_website/html/wordpress/
rm -rf /tmp/wordpress/
# ####################################

rm /tmp/setup.sh