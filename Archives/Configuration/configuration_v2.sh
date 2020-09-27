apt-get update && apt-get upgrade && apt-get install -y nginx \
wget \
php-fpm php-soap php-xml php-xmlrpc php-json php-mysql \
mariadb-server \
vim \
wordpress

## Remove Apache Landing Page ##
mv /var/www/html/index.html /var/www/html/index.html_bkp
##

## Mysql configuration ##
service mysql start
mysql -e "CREATE DATABASE wordpress"
mysql -e "GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION"
mysql -e "FLUSH PRIVILEGES"
##

##Configuring Nginx to use SSL and PHP Processor ##
mkdir /var/www/example.com
chown -R $USER:$USER /var/www/example.com
#copy example.com onto sites-available
chmod 755 /etc/nginx/sites-available/example.com
ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled
nginx -t
##


ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//' 