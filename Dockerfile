FROM ubuntu:latest
LABEL maintainer "andis.cirulis@whitedigital.eu"

#some general stuff
RUN apt-get update \
&& apt-get install -y vim \
&& apt-get install -y nginx

#lets use seperate command for now to speed up builds
RUN apt-get install -y php-fpm

# RUN sleep 1
# RUN service php7.0-fpm start
# RUN sleep 1
# RUN service nginx start
# RUN service
# RUN service php7.0-fpm start
# RUN service php7.0-fpm restart

# RUN service nginx stop

# #Expose http, https, mysql
# EXPOSE 80 443 3306

# # forward request and error logs to docker log collector
# RUN ln -sf /dev/stdout /var/log/nginx/access.log \
# 	&& ln -sf /dev/stderr /var/log/nginx/error.log

# CMD ["nginx", "-g", "daemon off;"]
WORKDIR /root
ADD startup.sh /root/

CMD ["/bin/bash"]
#ENTRYPOINT  ["bash"]