cd ..

apt-get update && apt-get upgrade && apt-get install -y nginx \
php-soap php-curl php-json php-xml php-fpm php-mysql php-mbstring php-gd \
php-xmlrpc php-zip \
mariadb-server \
wget \
wordpress

# Remove Apache Welcome Page
mv /var/www/html/index.html index.html_bkp

# SSL Configuration
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=BE/ST=BRUSSELS CITY/L=Brussels/O=19 Coding School/OU=lacollar/CN=example.com/emailAddress=lacollar@student.s19.be"
# openssl dhparam -out /etc/nginx/dhparam.pem 2048
# mv /etc/nginx/sites-available/default /etc/nginx/sites-available/example.com.bak
# ln -fs /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled
# rm /etc/nginx/sites-enabled/default
# mkdir -p /var/www/example.com/html
# chown -R $USER:$USER /var/www/example.com/html
# chmod -R 755 /var/www
# cp /usr/share/nginx/html/index.html /var/www/example.com/html/index.html
# # cp /etc/nginx/sites-enabled/example.com.conf
# ln -s /etc/nginx/sites-available/example.com.conf /etc/nginx/sites-enabled/example.com.conf

# rm /tmp/initial_setup.sh