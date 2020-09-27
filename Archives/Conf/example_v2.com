server {
    listen 80;
    listen [::]:80;

    root /var/www/example.com;
    index index.php index.html index.htm info.php;

    server_name example.com www.example.com;

    location / {
        try_files $uri $uri/ =404;
        autoindex on;
    }

    location ~ \.php$ {
        root /var/www/example.com;
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
    }
}