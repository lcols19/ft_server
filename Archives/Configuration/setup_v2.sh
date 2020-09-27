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

##Database conecction test
mysql -e "CREATE TABLE wordpress.todo_list (item_id INT AUTO_INCREMENT, content VARCHAR(255), PRIMARY KEY(item_id))"
mysql -e "INSERT INTO wordpress.todo_list (content) VALUES (\"My first important item\")"
mysql -e "INSERT INTO wordpress.todo_list (content) VALUES (\"My second important item\")"
mysql -e "INSERT INTO wordpress.todo_list (content) VALUES (\"My third important item\")"
mysql -e "INSERT INTO wordpress.todo_list (content) VALUES (\"and this one more thing\")"
mysql -e "SELECT * FROM wordpress.todo_list"


ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//' 