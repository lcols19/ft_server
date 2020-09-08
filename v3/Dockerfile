FROM debian:buster

COPY srcs/default.conf /etc/nginx/conf.d/default.conf
COPY srcs/info.php /usr/share/nginx/html/info.php

COPY srcs/configuration.sh /tmp/configuration.sh
RUN sh /tmp/configuration.sh

ENTRYPOINT service nginx start && service mysql start && service php7.3-fpm start && bash