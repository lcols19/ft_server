FROM debian:buster

ADD https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz .

COPY srcs/default.conf /etc/nginx/conf.d/default.conf
COPY srcs/info.php /usr/share/nginx/html/info.php

COPY srcs/configuration.sh /tmp/configuration.sh
RUN sh /tmp/configuration.sh

EXPOSE 80:80 443:443

ENTRYPOINT service nginx start && service mysql start && service php7.3-fpm start && bash