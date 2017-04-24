FROM ubuntu:latest
LABEL maintainer "andis.cirulis@whitedigital.eu"

#some general stuff
RUN apt-get update \
&& apt-get install -y vim


#Expose http, https, mysql
EXPOSE 80 443 3306
ENTRYPOINT  ["bash"]