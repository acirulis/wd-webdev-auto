FROM ubuntu:latest
LABEL maintainer "andis.cirulis@whitedigital.eu"

#some general stuff
#Add YARN repo
RUN apt update && apt -y install curl apt-transport-https language-pack-en-base software-properties-common
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

#Add 7.1 REPO
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN add-apt-repository -y ppa:ondrej/php

#update & install stuff
RUN apt update && apt upgrade -y \
&& apt install -y vim git yarn nginx bzip2

#lets use seperate command for now to speed up builds
RUN apt-get install -y php7.1-fpm \
    && apt-get install -y php7.1-mysql php7.1-mbstring php7.1-gd php7.1-bcmath php7.1-zip php7.1-xml php7.1-curl php7.1-intl php7.1-memcached

RUN apt-get install -y php7.1-xdebug
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

ADD php.ini /etc/php/7.1/fpm/php.ini

# Installing composer globally
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

# Installing nodejs and npm 
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get -y install nodejs
WORKDIR /usr/lib
RUN yarn global add gulp
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

CMD ["/bin/bash"]
#ENTRYPOINT  ["bash"]
