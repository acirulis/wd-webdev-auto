#!/bin/bash
echo 'xdebug.remote_host='$XDEBUG_REMOTE_HOST >> /etc/php/5.6/fpm/php.ini
service php5.6-fpm start
nginx -g "daemon off;"
