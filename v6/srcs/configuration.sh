apt-get update -y && apt-get upgrade -y && apt-get install -qq nginx \
mariadb-server php-mysql \
php-xml php-xmlrpc php-soap php-json php-fpm php-mbstring \
php-zip php-gd php-pear php-gettext php-cgi php-curl php-intl \
wordpress \
wget vim \

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