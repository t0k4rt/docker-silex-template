#!/bin/bash
set -e 
shopt -s nocasematch 

composer2="hhvm -v ResourceLimit.SocketDefaultTimeout=30 -v Http.SlowQueryThreshold=30000 /usr/local/bin/composer"

alias 
if [ "$1" == "setup" ] && [ "$2" == "silex" ]; then 
    cd /var/www/
    git clone https://github.com/t0k4rt/silex-startup-template.git silex
    cd silex
    composer install -vvvvv
    chown -R www-data:www-data /var/www/silex
    exit 0
elif [ "$1" == "update" ] && [ "$2" == "silex" ]; then 
    cd /var/www/silex
    git pull origin master
    exec $composer2 install -vvvvv
    chown -R www-data:www-data /var/www/silex
    exit 0
elif [ "$1" == "update" ] && [ "$2" == "code" ]; then 
    cd /var/www/silex
    git pull origin master
    chown -R www-data:www-data /var/www/silex
    exit 0
elif [ "$1" == "composer" ]; then 
    cd /var/www/silex
    exec $composer2 $2 -vvvvv
    chown -R www-data:www-data /var/www/silex
    exit 0
fi
    

key=$1
shift
echo "Running command: $key $@"
exec $key $@
