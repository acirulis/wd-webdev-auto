FROM debian:buster
LABEL maintainer "andis.cirulis@whitedigital.eu"

#some general stuff
RUN apt update \
&& apt -y install curl build-essential apt-transport-https software-properties-common tzdata unzip cron mariadb-client \
#Set correct timezone
&& ln -fs /usr/share/zoneinfo/Europe/Riga /etc/localtime && dpkg-reconfigure -f noninteractive tzdata


# update and install utils & Certbot for letsencrypt
RUN apt update && apt upgrade -y \
&& apt install -y vim nano git nginx bzip2 wget


#PHP
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
&& echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list \
&& apt update \
&& apt-get install -y php7.4-fpm \
    && apt-get install -y php7.4-mysql php7.4-mbstring php7.4-gd php7.4-bcmath php7.4-zip php7.4-xml php7.4-curl php7.4-intl php7.4-memcached php7.4-imap php7.4-pgsql

#DEBUG
RUN apt-get install -y php7.4-xdebug

# # forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
 	&& ln -sf /dev/stderr /var/log/nginx/error.log

WORKDIR /root
ADD startup.sh ./
RUN chmod a+x startup.sh


ADD php.ini /etc/php/7.4/fpm/php.ini

# Installing composer globally
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
&& php composer-setup.php \
&& php -r "unlink('composer-setup.php');" \
&& mv composer.phar /usr/local/bin/composer

#Install NodeJs & Yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
&& apt install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt update && apt install yarn

# #Expose http, https, xdebug
EXPOSE 80 443

CMD ["/bin/bash"]
#ENTRYPOINT  ["bash"]
