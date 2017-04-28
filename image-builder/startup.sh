#!/bin/bash
echo 'xdebug.remote_host='$XDEBUG_REMOTE_HOST >> /etc/php/7.0/fpm/php.ini
service php7.0-fpm start
nginx -g "daemon off;"
