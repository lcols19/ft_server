docker cp ./my_website test:/etc/nginx/sites-available
docker cp ./info.php test:/var/www/my_website
docker container prune