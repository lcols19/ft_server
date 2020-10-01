FROM debian:buster

COPY ./my_website /etc/nginx/sites-available/
COPY ./info.php /var/www/my_website/

COPY ./setup.sh /tmp/
RUN chmod 777 /tmp/setup.sh
RUN /tmp/setup.sh