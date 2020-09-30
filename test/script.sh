# Packages Installation
apt-get update -y && apt-get upgrade -y && apt-get install -qq nginx
apt-get install -qq mariadb-server
apt-get install -qq php-fpm php-mysql

# no need to run mysal_secure_installation
# Database System Installation
mysql - e "CREATE DATABASE wordpress"
mysql - e "GRANT ALL ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION"
mysql - e "FLUSH PRIVILEGES"

# Nginx Configuration for PHP
mkdir /var/www/localhost
chown -R $USER:$USER /var/www/localhost
# nano /etc/nginx/sites-available/localhost -> make a copy from tmp
# should create localhost file with all its setup
mv /tmp/localhost /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
nginx -t
service nginx restart

# PHP Test
# nano /var/www/localhost/info.php -> copy from tmp
mv /tmp/info.php /var/www/localhost
# should now rm the file

# Self-Signed SSL Certificate Creation
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
/etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
openssl dhparam -out /etc/nginx/dhparam.pem 4096
# nano /etc/nginx/snippets/self-signed.conf -> cp from tmp
mv /tmp/self-signed.conf /etc/nginx/snippets/
cp /etc/nginx/sites-available/localhost /etc/nginx/sites-available/localhost.bak
# nano /etc/nginx/sites-available/localhost -> copy from tmp
mv /tmp/localhost -> /etc/nginx/sites-available/