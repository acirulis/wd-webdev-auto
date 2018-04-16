#!/bin/bash
echo 'xdebug.remote_host='$XDEBUG_REMOTE_HOST >> /etc/php/5.6/apache2/php.ini

# Apache gets grumpy about PID files pre-existing
rm -f /var/run/apache2/apache2.pid

/usr/sbin/apache2ctl -D FOREGROUND