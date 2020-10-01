#! /bin/bash

# Back to Home Directory
cd ..

# Packages Installation ####
apt-get update -y && apt-get upgrade -y && apt-get install -qq nginx \
mariadb-server wget curl \
php-{json,mbstring,curl,gd,intl,fpm,soap,xml,xmlrpc,zip,mysql}
############################

# Self-Signed SSL Certificate Creation ###############
# service mysql start
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
# /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
# -subj "/C=BE/ST=BRUSSELS CITY/L=Brussels/O=19 Coding School/OU=Lacollar/CN=172.17.0.2/emailAddress=lacollar@student.s19.be"

# no need to run mysql_secure_installation

# # Database System Installation #####
# service mysql start
# mysql -e "CREATE DATABASE laurettas_db"
# mysql -e "GRANT ALL ON laurettas_db.* TO 'laurettas_db'@'localhost' IDENTIFIED BY 'lauretta' WITH GRANT OPTION"
# mysql -e "FLUSH PRIVILEGES"
# ####################################

# # Nginx Configuration for PHP ########
# # service nginx start
# chown -R $USER:$USER /var/www/my_website
# # nano /etc/nginx/sites-available/my_website -> make a copy from tmp (creation)
# rm /etc/nginx/sites-*/default
# ln -s /etc/nginx/sites-available/my_website /etc/nginx/sites-enabled/
# # nginx -t
# # service nginx restart
# ######################################

# # PHP Test #####
# service php7.3-fpm start
# # nano /var/www/my_website/info.php -> copy from tmp 
# # should now rm the file
# ################