#! /bin/bash
service mysql start
mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci"
# removed identified by as I don't see the use of it here
mysql -e "GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password'"
mysql -e "FLUSH PRIVILEGES"
rm /mysql_configuration.sh
