docker system prune -fa
docker build -t ft_server_image:latest .
docker run -p 80:80 -p 443:443 --name ft_server_container -ti ft_server_image:latest /bin/bash