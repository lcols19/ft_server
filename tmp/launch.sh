docker stop test
docker rm $(docker ps -aq)
docker system prune -af
docker build -t myimage:latest .
docker run --name test -ti myimage:latest /bin/bash
