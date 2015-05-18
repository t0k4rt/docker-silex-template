#!/bin/bash
if [ $DEBUG ]; then
    echo "xdebug.remote_connect_back=On" >> /etc/php5/fpm/conf.d/20-xdebug.ini
    echo "xdebug.remote_enable=On" >> /etc/php5/fpm/conf.d/20-xdebug.ini
fi