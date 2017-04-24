FROM ubuntu:latest
LABEL maintainer "andis.cirulis@whitedigital.eu"

#some general stuff
RUN apt-get update \
&& apt-get install -y vim \
&& apt-get install -y nginx


#Expose http, https, mysql
EXPOSE 80 443 3306

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["nginx", "-g", "daemon off;"]

#ENTRYPOINT  ["bash"]