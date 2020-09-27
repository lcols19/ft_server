FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx

RUN ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'