FROM debian:buster

COPY ./my_website /etc/nginx/sites-available/my_website
COPY srcs/my_website.bak /etc/nginx/sites-available/my_website.bak
COPY srcs/info.php /var/www/my_website/
COPY ./setup.sh /tmp/
COPY ./self-signed.conf /etc/nginx/snippets/
COPY ./ssl-params.conf /etc/nginx/snippets/
COPY ./phpMyAdmin.conf /etc/nginx/sites-available/

EXPOSE 80:80 443:443

RUN chmod 777 /tmp/setup.sh
RUN /tmp/setup.sh
