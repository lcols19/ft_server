docker container stop test
docker system prune -f
docker builder build -t myimage .
docker run --name test -ti myimage:latest /bin/bash