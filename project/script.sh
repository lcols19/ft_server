# Packages Installation ####
apt-get update -y && apt-get upgrade -y && apt-get install -qq nginx \
mariadb-server wget curl \
php-{json,mbstring,curl,gd,intl,fpm,soap,xml,xmlrpc,zip,mysql}
############################

# no need to run mysql_secure_installation

# Database System Installation #####
service mysql start
mysql -e "CREATE DATABASE laurettas_db"
mysql -e "GRANT ALL ON laurettas_db.* TO 'laurettas_db'@'localhost' IDENTIFIED BY 'lauretta' WITH GRANT OPTION"
mysql -e "FLUSH PRIVILEGES"
####################################

# Nginx Configuration for PHP ########
service nginx start
mkdir /var/www/my_website
chown -R $USER:$USER /var/www/my_website
# nano /etc/nginx/sites-available/my_website -> make a copy from tmp (creation)
mv /tmp/my_website /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/my_website /etc/nginx/sites-enabled/
nginx -t
service nginx restart
######################################

# PHP Test #####
service php7.3-fpm start
# nano /var/www/my_website/info.php -> copy from tmp 
mv /tmp/info.php /var/www/my_website
# should now rm the file
################

# Self-Signed SSL Certificate Creation ###############
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
/etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
openssl dhparam -out /etc/nginx/dhparam.pem 4096
# nano /etc/nginx/snippets/self-signed.conf -> cp from tmp
mv /tmp/self-signed.conf /etc/nginx/snippets/
# nano /etc/nginx/snippets/ssl-params.conf
mv /tmp/ssl-params.conf /etc/nginx/snippets/
cp /etc/nginx/sites-available/my_website /etc/nginx/sites-available/my_website.bak
# nano /etc/nginx/sites-available/my_website -> copy from tmp
mv /tmp/localhost /etc/nginx/sites-available/
nginx -t
service restart nginx
# replace one line in server block
######################################################

# PHPMyAdmin Installation #################
wget -P /usr/share \
https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
tar -xzvf /usr/share/phpMyAdmin-latest-all-languages.tar.gz
rm /usr/share/phpMyAdmin-latest-all-languages.tar.gz
mv /usr/share/phpMyAdmin-latest-all-languages /usr/share/phpMyAdmin
cp -pr /usr/share/phpMyAdmin/config.sample.inc.php \
/usr/share/phpMyAdmin/config.inc.php
# nano /usr/share/phpMyAdmin/config.inc.php -> cp from tmp
rm /usr/share/phpMyAdmin/config.inc.php
mv /tmp/config.inc.php /usr/share/phpMyAdmin
mysql < /usr/share/phpMyAdmin/sql/create_tables.sql -u root -p
mysql -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'pmapass'"
mysql -e "FLUSH PRIVILEGES"
# nano /etc/nginx/conf.d/phpMyAdmin.conf -> cp from tmp (creation)
mv /tmp/phpMyAdmin.conf /etc/nginx/conf.d/
mkdir /usr/share/phpMyAdmin/tmp
chmod 777 /usr/share/phpMyAdmin/tmp
chown -R www-data:www-data /usr/share/phpMyAdmin
service nginx restart && service php7.3-fpm restart
mysql -e "CREATE DATABASE app_db"
mysql -e "GRANT ALL PRIVILEGES ON app_db.* TO 'app_user'@'localhost' IDENTIFIED BY 'password'"
mysql -e "FLUSH PRIVILEGES"
###########################################

# Wordpress Installation ###########
mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci"
mysql -e "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password'"
mysql -e "FLUSH PRIVILEGES"
service php7.3-fpm restart
# nano /etc/nginx/sites-available/localhost -> cp from tmp (editing)
mv /tmp/my_website /etc/nginx/sites-available/
nginx -t
cd /tmp && curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
rm latest.tar.gz
cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
cp -a /tmp/wordpress/. /var/www/my_website
chown -R www-data:www-data /var/www/your_domain
# /var/www/my_website/wp-config.php -> cp from tmp (editing)
cp /tmp/wp-config.php /var/www/my_website/
####################################

# Autoindex setup ##
cp /tmp/my_website /etc/nginx/sites-available/
####################

# to get ip address : docker-machine ip

# Check if I don't have file to remove
# Copy files onto the container through docker copy
# Restart services eventually