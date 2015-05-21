#!/bin/bash
set -e 
shopt -s nocasematch


if [ "$1" == "setup" ] && [ "$2" == "silex" ]; then 
    cd /var/www/
    git clone https://github.com/t0k4rt/silex-startup-template.git silex
    cd silex
    composer install
    chown -R www-data:www-data /var/www/silex
    exit 0
elif [ "$1" == "update" ] && [ "$2" == "silex" ]; then 
    cd /var/www/silex
    git pull origin master
    composer update
    chown -R www-data:www-data /var/www/silex
    exit 0
fi
    
echo "Running command: $@"
exec $@
