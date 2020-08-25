server {
    listen 443 ssl;
    listen [::]:443 ssl;

    include snippets/self-signed.conf;
    include snippets/ssl-params.conf;

    root /var/www/example.com;
    index index.php index.html index.htm index.php;

    server_name example.com www.example.com;

    location / {
        try_files $uri $uri/ =404;
        autoindex on;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
    }
}

server {
    listen 80;
    listen [::]:80;

    server_name example.com www.example.com;

    return 301 https://$server_name$request_uri;
}