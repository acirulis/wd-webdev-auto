FROM ubuntu:latest
LABEL maintainer "andis.cirulis@whitedigital.eu"

#some general stuff
#Add YARN repo
RUN apt update && apt -y install curl apt-transport-https
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

#update & install stuff
RUN apt update && apt upgrade -y \
&& apt install -y vim git yarn nginx bzip2

#lets use seperate command for now to speed up builds
RUN apt-get install -y php-fpm \
    && apt-get install -y php-mysql php-mbstring php-gd php-bcmath php-zip php-xml php-curl php-intl php-memcached

RUN apt-get install -y php-xdebug
# #Expose http, https, xdebug
EXPOSE 80 443

# # forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
 	&& ln -sf /dev/stderr /var/log/nginx/error.log

WORKDIR /root
ADD startup.sh ./
RUN chmod a+x startup.sh

ADD setup_gulp.py /usr/local/bin/
RUN chmod a+x /usr/local/bin/setup_gulp.py

ADD php.ini /etc/php/7.0/fpm/php.ini

# Installing composer globally
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

# Installing nodejs and npm 
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get -y install nodejs
WORKDIR /usr/lib
RUN yarn add gulp
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

CMD ["/bin/bash"]
#ENTRYPOINT  ["bash"]
