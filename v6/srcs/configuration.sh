apt-get update -y && apt-get upgrade -y && apt-get install -qq nginx \
mariadb-server php-mysql \
php7.3 php-xml php-xmlrpc php-soap php-json php-fpm php-mbstring \
php-zip php-gd php-pear php-gettext php-cgi php-curl php-intl \
php-mysql php-common php-cli php-opcache php7.3-readline \
wordpress \
vim wget

## Apache2 Removal ##
apt-get remove --purge apache2 -y
#####################

# SSL Configuration ##
service mysql start
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
/etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=BE/ST=BRUSSELS CITY/L=Brussels/O=19 Coding School/OU=Lacollar/CN=172.17.0.2/emailAddress=lacollar@student.s19.be"
openssl dhparam -out /etc/nginx/dhparam.pem 2048
#snippets creation
#conf file editing
######################

## PHP Processor Configuration on Nginx ##
# mv /var/www/example.com /var/www/example.com.bak
mkdir /var/www/example.com
cp /var/www/html/index.nginx-debian.html var/www/example.com/index.nginx-debian.html
chown -R $USER:$USER /var/www/example.com
#copy example onto sites-available
chmod 755 /etc/nginx/sites-available/example.com
ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled
nginx -t
##########################################

# ## phpMyAdmin Installation ##
rm /phpMyAdmin-4.9.0.1-all-languages.tar.gz
# mkdir /usr/share/phpMyAdmin
mv /phpMyAdmin-4.9.0.1-all-languages /usr/share/phpMyAdmin
mv /usr/share/config.inc.php /usr/share/phpMyAdmin/
#save config.sample, copy config
mysql < /usr/share/phpMyAdmin/sql/create_tables.sql -u root
mysql -u root -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'pmapass'"
mysql -u root -e "FLUSH PRIVILEGES"
#copy phpmyadmin.conf onto /etc/nginx/conf.d
# mkdir /usr/share/phpMyAdmin/tmp
# chmod 777 /usr/share/phpMyAdmin/tmp
chown -R www-data:www-data /usr/share/phpMyAdmin
mysql -u root -e "CREATE DATABASE app_db"
mysql -u root -e "GRANT ALL PRIVILEGES ON app_db.* TO 'app_user'@'localhost' IDENTIFIED BY 'password'"
mysql -u root -e "FLUSH PRIVILEGES"
# #############################

chown www-data:www-data /usr/share/nginx/html -R

# rm /etc/nginx/sites-enabled/default
# copy default.conf onto /etc/nginx/conf.d/

# copy info.php onto /usr/shar/nginx/html

# phpmyadmin config
service php-fpm7.3 start
tar -xzvf phpMyAdmin-4.9.5-all-languages.tar.gz
mv -f phpMyAdmin-4.9.5-all-languages /var/www/html/phpmyadmin
rm phpMyAdmin-4.9.5-all-languages.tar.gz
# cp /var/www/html/phpmyadmin/config.inc.php /var/www/html/phpmyadmin/config.sample.inc.php

# Wordpress conf
service mysql start
mysql -u root -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci"
mysql -u root -e "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password'"
mysql -u root -e "FLUSH PRIVILEGES"

ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'