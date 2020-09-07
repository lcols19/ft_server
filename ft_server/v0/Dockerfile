# Parent image
ARG VERSION=buster
FROM debian:${VERSION}

# LABEL about the custom image
LABEL maintainer="lacollar@student.s19.be"
LABEL version="O.1"
LABEL description="This is a custom Docker Image for a LEMP Stack with \
	phpMyadmin, autoindex, WordPress, SSL."

# To remove error message saying "unable to initialize frontend :
# Dialog" and in order to not have to interact during building of image
ENV DEBIAN_FRONTED noninteractive
ENV TERM linux

# Expose ports
EXPOSE 80:80 443:443

# Inserts new value in debconf database
#RUN echo 'debconf debconf/frontend select Noninteractive' |
#debconf-set-selections

RUN apt-get update && apt-get install -y nginx \
	mariadb-server\
	php-fpm php-mysql\
	php-json php-mbstring\
	wordpress\
	wget\
	php-curl php-gd php-intl php-soap php-xml php-xmlrpc php-zip
	#ufw
# RUN apt-get upgrade

#RUN rm /etc/nginx/sites-available/default

RUN mv /etc/nginx/sites-available/default /etc/nginx/sites-available/example.com.bak
COPY srcs/self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY srcs/ssl-params.conf /etc/nginx/snippets/ssl-params.conf
COPY srcs/example.com etc/nginx/sites-available/example.com 
COPY srcs/ssl_configuration.sh /ssl_configuration.sh
#RUN rm /etc/nginx/nginx.conf
#COPY srcs/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 ssl_configuration.sh
RUN sh ssl_configuration.sh

## to uncomment right after ##
# configure mysql for wordpress
# COPY srcs/mysql_configuration.sh /mysql_configuration.sh
# RUN chmod 755 mysql_configuration.sh
# RUN sh mysql_configuration.sh
# RUN service php7.3-fpm start
## to uncomment right after ##

# to remove the "not enabling php 7-3 fpm by default" warning message
#RUN a2enconf php7.3-fpm && service php7.3-fpm start

## to uncomment right after ##
# Installation of phpmyadmin
# COPY srcs/phpmyadmin_installation.sh phpmyadmin_installation.sh
#RUN rm /usr/share/phpMyAdmin/config.inc.php
# COPY srcs/config.inc.php /tmp/config.inc.php
# RUN chmod 755 phpmyadmin_installation.sh
# RUN service mysql start
# RUN sh phpmyadmin_installation.sh
## to uncomment right after ##

## to uncomment right after ##
# changing the conf file of nginx
# RUN rm /etc/nginx/nginx.conf
# COPY srcs/nginx.conf /etc/nginx/nginx.conf
## to uncomment right after ##

## to uncomment right after ##
# RUN rm  /etc/apt/sources.list
# COPY srcs/sources.list /etc/apt/sources.list
## to uncomment right after ##

## to uncomment right after ##
# delete apache2 welcome page
# RUN rm /var/www/html/index.html
## to uncomment right after ##

# restart nginx in a script otherwise when container is run nginx is on stop mode
#RUN service nginx start

CMD service nginx start && service mysql start && service php-7.3-fpm start
