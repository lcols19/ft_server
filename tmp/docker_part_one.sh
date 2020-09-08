#! /bin/bash

docker container stop test
docker system prune -fa 
docker builder build -t myimage .
docker container run -p 80:80 -p 443:443 --name test -it myimage:latest /bin/bash #-d
docker container ls -a
docker container exec -ti test /bin/bash


