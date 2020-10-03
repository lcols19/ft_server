#! /bin/bash

# Back to Home Directory
cd

# Packages Installation ####
apt-get update -y && apt-get upgrade -y && apt-get install -qq nginx \
wget curl vim \
php-{json,mbstring,curl,gd,intl,fpm,soap,xml,xmlrpc,zip} mariadb-server
# apt-get install -qq php-mysql
############################

# no need to run mysql_secure_installation

# # Self-Signed SSL Certificate Creation ###############
# # service mysql start
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
# /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
# -subj "/C=BE/ST=BRUSSELS CITY/L=Brussels/O=19 Coding School/OU=Lacollar/CN=172.17.0.2/emailAddress=lacollar@student.s19.be"
# openssl dhparam -out /etc/nginx/dhparam.pem 2048
# # nginx -t
# # service nginx restart
# # replace one line in server block
# ######################################################

# # Database System Installation #####
# # service mysql start
# mysql -e "CREATE DATABASE laurettas_db"
# mysql -e "GRANT ALL ON laurettas_db.* TO 'laurettas_db'@'localhost' IDENTIFIED BY 'lauretta' WITH GRANT OPTION"
# mysql -e "FLUSH PRIVILEGES"
# ####################################

# # Nginx Configuration for PHP ########
# # service nginx start
# chown -R $USER:$USER /var/www/my_website
# rm /etc/nginx/sites-*/default
# ln -s /etc/nginx/sites-available/my_website /etc/nginx/sites-enabled/
# nginx -t
# service nginx restart
# ######################################

# # PHP Test #####
# service php7.3-fpm start
# # nano /var/www/my_website/info.php -> copy from tmp 
# # should now rm the file
# ################

# # PHPMyAdmin Installation #################
# wget -P /usr/share \
# https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
# tar -xzvf /usr/share/phpMyAdmin-latest-all-languages.tar.gz --directory /var/www/my_website/
# rm /var/www/my_website/phpMyAdmin-latest-all-languages.tar.gz
# mv /var/www/my_website/phpMyAdmin-* /var/www/my_website/phpMyAdmin
# mysql < /usr/share/phpMyAdmin/sql/create_tables.sql -u root
# mysql -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'pmapass'"
# mysql -e "FLUSH PRIVILEGES"
# ln -s /etc/nginx/sites-available/phpMyAdmin.conf /etc/nginx/sites-enabled/