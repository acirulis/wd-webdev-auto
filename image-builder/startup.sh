#!/bin/bash
echo 'xdebug.remote_host='$XDEBUG_REMOTE_HOST >> /etc/php/7.2/fpm/php.ini
service php7.2-fpm start
nginx -g "daemon off;"
