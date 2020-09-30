docker stop test
docker system prune -f
docker build -t myimage:latest .
docker run -p 80:80 -p 443:443 --name test -ti myimage:latest /bin/bash