FROM debian:buster

COPY srcs/my_website /etc/nginx/sites-available/my_website
COPY srcs/my_website.bak /etc/nginx/sites-available/my_website.bak
COPY srcs/info.php /tmp/
COPY srcs/setup.sh /tmp/
COPY srcs/self-signed.conf /etc/nginx/snippets/
COPY srcs/ssl-params.conf /etc/nginx/snippets/
COPY srcs/config.inc.php /tmp/
COPY srcs/phpMyAdmin.conf /etc/nginx/sites-available/
COPY srcs/wp-config.php /tmp/wordpress/

EXPOSE 80:80 443:443

RUN chmod 777 /tmp/setup.sh
RUN /tmp/setup.sh

ENTRYPOINT	service nginx start && service php7.3-fpm start && service mysql \
			start && bash
CMD tail -f /dev/null