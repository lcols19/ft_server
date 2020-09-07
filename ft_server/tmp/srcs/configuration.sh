## Packages Installation ##
apt-get update -y && apt-get upgrade -y && apt-get install -qq nginx \
php-json php-xmlrpc php-xml php-soap php-fpm php-mysql php-mbstring \
mariadb-server \
wordpress \
vim wget
###########################

# wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
# tar -xzvf phpMyAdmin-4.9.0.1-all-languages.tar.gz

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
mv /phpMyAdmin-4.9.0.1-all-languages /usr/share/phpMyAdmin
#save config.sample, copy config
mysql < /usr/share/phpMyAdmin/sql/create_tables.sql -u root
mysql -u root -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'pmapass'"
mysql -u root -e "FLUSH PRIVILEGES"
#copy phpmyadmin.conf onto /etc/nginx/conf.d
mkdir /usr/share/phpMyAdmin/tmp
chmod 777 /usr/share/phpMyAdmin/tmp
chown -R www-data:www-data /usr/share/phpMyAdmin
mysql -u root -e "CREATE DATABASE app_db"
mysql -u root -e "GRANT ALL PRIVILEGES ON app_db.* TO 'app_user'@'localhost' IDENTIFIED BY 'password'"
mysql -u root -e "FLUSH PRIVILEGES"
# #############################

# IP Address display
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'

rm /tmp/configuration.sh