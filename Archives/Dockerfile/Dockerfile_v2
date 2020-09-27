FROM debian:buster

ADD https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz .

COPY srcs/example.com /etc/nginx/sites-available/example.com
COPY srcs/info.php /var/www/example.com/info.php
# COPY srcs/info.php /var/www/info.php
COPY srcs/todo_list.php /var/www/example.com/todo_list.php
COPY srcs/test.html /var/www/html/test.html

COPY srcs/setup.sh /tmp/setup.sh
RUN sh /tmp/setup.sh

ENTRYPOINT service nginx start && service mysql start && service php7.3-fpm start && bash