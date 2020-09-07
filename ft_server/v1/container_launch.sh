clear
docker stop test
docker system prune -f
docker build -t myimage .
docker run --name test -ti myimage:latest /bin/bash