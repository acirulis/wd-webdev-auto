FROM ubuntu:latest
LABEL maintainer "andis.cirulis@whitedigital.eu"

#some general stuff
#Add YARN repo
RUN apt update && apt -y install curl apt-transport-https language-pack-en-base software-properties-common tzdata
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list


#Set correct timezone
RUN ln -fs /usr/share/zoneinfo/Europe/Riga /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

#Add 5.6 REPO
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN add-apt-repository -y ppa:ondrej/php

#update & install stuff
RUN apt update && apt upgrade -y \
&& apt install -y vim nano git yarn nginx bzip2

#lets use seperate command for now to speed up builds
RUN apt-get install -y php5.6-fpm \
    && apt-get install -y php5.6-mysql php5.6-mbstring php5.6-gd php5.6-bcmath php5.6-zip php5.6-xml php5.6-curl php5.6-intl php5.6-memcached

RUN apt-get install -y php5.6-xdebug
# #Expose http, https, xdebug
EXPOSE 80 443

# # forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
 	&& ln -sf /dev/stderr /var/log/nginx/error.log

WORKDIR /root
ADD startup.sh ./
RUN chmod a+x startup.sh

# ADD setup_gulp.py /usr/local/bin/
# RUN chmod a+x /usr/local/bin/setup_gulp.py

ADD php.ini /etc/php/5.6/fpm/php.ini

# Installing composer globally
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

# Installing nodejs and npm 
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt install -y nodejs
RUN npm install npm --global

CMD ["/bin/bash"]
#ENTRYPOINT  ["bash"]
