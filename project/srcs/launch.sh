cd ..
docker build -t ft_server_image:latest .
docker-machine ip
docker run -p 80:80 -p 443:443 --name ft_server_container -ti ft_server_image:latest /bin/bash