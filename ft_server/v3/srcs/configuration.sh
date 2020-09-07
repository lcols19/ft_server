apt-get update && apt-get upgrade && apt-get install -y nginx \
mariadb-server php-mysql \
php-xml php-xmlrpc php-soap php-json php-fpm \
wordpress \
wget vim \

chown www-data:www-data /usr/share/nginx/html -R

# mysql -e "CREATE DATABASE wordpress"
# mysql -e "CREATE USER 'testuser' IDENTIFIED BY 'password'"
# mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'testuser"

# mkdir 

# rm /etc/nginx/sites-eabled/default
# copy default.conf onto /etc/nginx/conf.d/

# copy info.php onto /usr/shar/nginx/html

ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'