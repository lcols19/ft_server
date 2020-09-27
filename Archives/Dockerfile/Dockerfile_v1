FROM debian:buster

COPY srcs/initial_setup.sh /tmp/initial_setup.sh
# COPY srcs/self-signed.conf /etc/nginx/snippets/self-signed.conf
# COPY srcs/ssl-params.conf /etc/nginx/snippets/ssl-params.conf
# COPY srcs/example.com /etc/nginx/sites-available/example.com
# COPY /srcs/example.com.conf /etc/nginx/sites-available/example.com.conf
RUN sh /tmp/initial_setup.sh
# CMD service nginx start && service mysql start && service php7.3-fpm start