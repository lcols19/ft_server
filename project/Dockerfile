FROM debian:buster

COPY ./my_website /etc/nginx/sites-available/my_website.bak
COPY srcs/my_website.bak /etc/nginx/sites-available/my_website
COPY srcs/info.php /var/www/my_website/
COPY srcs/setup.sh /tmp/
COPY ./self-signed.conf /etc/nginx/snippets/
COPY ./ssl-params.conf /etc/nginx/snippets/

RUN chmod 777 /tmp/setup.sh
RUN /tmp/setup.sh

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
/etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=BE/ST=BRUSSELS CITY/L=Brussels/O=19 Coding School/OU=Lacollar/CN=172.17.0.2/emailAddress=lacollar@student.s19.be"