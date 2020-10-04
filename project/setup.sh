#! /bin/bash

# Back to Home Directory
cd

### Packages Installation ####
apt-get update -y && apt-get upgrade -y && apt-get install -qq nginx \
wget curl vim \
php-{json,mbstring,curl,gd,intl,fpm,soap,xml,xmlrpc,zip} mariadb-server
apt-get install -qq php-mysql
############################


### LEMP Installation ######################
# # Database System Installation #####
# service mysql start
mysql -e "CREATE DATABASE laurettas_db"
mysql -e "GRANT ALL ON laurettas_db.* TO 'laurettas_db'@'localhost' IDENTIFIED BY 'lauretta' WITH GRANT OPTION"
mysql -e "FLUSH PRIVILEGES"
# #
# # Nginx Configuration for PHP ########
# service nginx start
# mkdir /var/www/my_website_1/html
chown -R $USER:$USER /var/www/my_website_1
chown -R $USER:$USER /var/www/my_website_1/html
# creatiiong of my_website_1 conf file
rm /etc/nginx/sites-*/default
ln -s /etc/nginx/sites-available/my_website_1 /etc/nginx/sites-enabled/
# nginx -t
service nginx restart
# #
# # PHP Test
# create info.php
# #
############################################

### Self-Signed SSL Certificate Creation ###############
service mysql start
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
/etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=BE/ST=BRUSSELS CITY/L=Brussels/O=19 Coding School/OU=Lacollar/CN=172.17.0.2/emailAddress=lacollar@student.s19.be"
openssl dhparam -out /etc/nginx/dhparam.pem 2048
# creation self-signed.conf
# creation ssl-params
# create my_website_1.bak
# cp /etc/nginx/sites-available/my_website_1 /etc/nginx/sites-available/my_website_1.bak
# edit my_website_1 -> create my_website_2
# nginx -t
service nginx restart
# # replace one line in server block
# ######################################################

### PHP Test #####
# creation info.php
# service php7.3-fpm start
# check if it works
# rm info.php
# ################

### PHPMyAdmin Installation #################
wget -P /var/www/my_website_1/html \
https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
tar -xzvf /var/www/my_website_1/html/phpMyAdmin-latest-all-languages.tar.gz \
--directory /var/www/my_website_1/html/
rm /var/www/my_website_1/html/phpMyAdmin-*.tar.gz
mv /var/www/my_website_1/html/phpMyAdmin-* /var/www/my_website_1/html/phpMyAdmin
# creation config.sample.inc.php
mysql < /var/www/my_website_1/html/phpMyAdmin/sql/create_tables.sql -u root
mysql -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'lauretta'@'localhost' IDENTIFIED BY 'collard'"
mysql -e "FLUSH PRIVILEGES"
# creation phpMyAdmin.conf
# ln -s /etc/nginx/sites-available/phpMyAdmin.conf /etc/nginx/sites-enabled/ : not sure I have to do this
# mkdir /usr/share/phpMyAdmin/tmp
# chmod 777 /usr/share/phpMyAdmin/tmp
# chown -R www-data:www-data /usr/share/phpMyAdmin
# service nginx restart && service php7.3-fpm restart
# mysql -e "CREATE DATABASE app_db"
# mysql -e "GRANT ALL PRIVILEGES ON app_db.* TO 'lauretta'@'localhost' IDENTIFIED BY 'collard'"
# mysql -e "FLUSH PRIVILEGES"
# ###########################################


### Wordpress Installation ###########
# mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci"
# mysql -e "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password'"
# mysql -e "FLUSH PRIVILEGES"
# service php7.3-fpm restart
# # nano /etc/nginx/sites-available/my_website -> cp from tmp (editing)
# mv /tmp/my_website /etc/nginx/sites-available/
# nginx -t
# cd /tmp && curl -LO https://wordpress.org/latest.tar.gz
# tar xzvf latest.tar.gz
# rm latest.tar.gz
# cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
# cp -a /tmp/wordpress/. /var/www/my_website
# chown -R www-data:www-data /var/www/your_domain
# # /var/www/my_website/wp-config.php -> cp from tmp (editing)
# cp /tmp/wp-config.php /var/www/my_website/
# ####################################