FROM debian:buster

ADD https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz ./
RUN tar -xzvf phpMyAdmin-4.9.0.1-all-languages.tar.gz

COPY srcs/example.com /etc/nginx/sites-available/example.com
COPY srcs/self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY srcs/ssl-params.conf /etc/nginx/snippets/ssl-params.conf
COPY srcs/config.inc.php /usr/share/phpMyAdmin/config.inc.php
# COPY srcs/phpMyAdmin.conf /etc/nginx/conf.d/phpMyAdmin.conf

COPY srcs/configuration.sh /tmp/configuration.sh
RUN chmod 755 /tmp/configuration.sh
RUN sh /tmp/configuration.sh

ENTRYPOINT service nginx start && service mysql start && service php7.3-fpm start && bash