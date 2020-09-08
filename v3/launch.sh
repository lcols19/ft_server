docker stop test
docker system prune -f
docker build -t myimage:latest .
docker run --name test -ti myimage:latest /bin/bash