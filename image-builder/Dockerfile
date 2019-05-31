FROM ubuntu:latest
LABEL maintainer "andis.cirulis@whitedigital.eu"

#some general stuff
RUN apt update && apt -y install curl apt-transport-https language-pack-en-base software-properties-common tzdata
#Add YARN repo
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

#Set locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN add-apt-repository -y ppa:ondrej/php

#Set correct timezone
RUN ln -fs /usr/share/zoneinfo/Europe/Riga /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

#update & install stuff
RUN apt update && apt upgrade -y \
&& apt install -y vim nano git yarn nginx bzip2

#PHP
RUN apt-get install -y php7.3-fpm \
    && apt-get install -y php7.3-mysql php7.3-mbstring php7.3-gd php7.3-bcmath php7.3-zip php7.3-xml php7.3-curl php7.3-intl php7.3-memcached php7.3-imap

#DEBUG
RUN apt-get install -y php7.3-xdebug
# #Expose http, https, xdebug
EXPOSE 80 443

# # forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
 	&& ln -sf /dev/stderr /var/log/nginx/error.log

WORKDIR /root
ADD startup.sh ./
RUN chmod a+x startup.sh

#Global gulp setup seems to be not a good idea
##ADD setup_gulp.py /usr/local/bin/
#RUN chmod a+x /usr/local/bin/setup_gulp.py

ADD php.ini /etc/php/7.3/fpm/php.ini

# Installing composer globally
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN composer global require hirak/prestissimo

# Installing nodejs and npm 
# RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
# RUN apt-get -y install nodejs
# WORKDIR /usr/lib
# RUN yarn global add gulp
# RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
#Install NodeJs & NPM - NEW
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt install -y nodejs
RUN npm install npm --global

CMD ["/bin/bash"]
#ENTRYPOINT  ["bash"]
