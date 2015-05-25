#!/bin/bash
set -e 
shopt -s nocasematch 

composer2="hhvm -v ResourceLimit.SocketDefaultTimeout=30 -v Http.SlowQueryThreshold=30000 /usr/local/bin/composer"

if [ -z "$REPO" ]; then 
    REPO="https://github.com/t0k4rt/silex-startup-template.git"
fi

WWW="/var/www"
APP_DIR="app"
APP_DIRPATH="$WWW/$APP_DIR"

alias 
if [ "$1" == "setup" ] && [ "$2" == "silex" ]; then 
    cd $WWW
    if  [ -f "$APP_DIR/composer.json" ]; then
        printf "\x1b[93;41m Silex project already exists \x1b[0m \n";
        exit 0
    fi
    git clone $REPO $APP_DIR
    cd $APP_DIRPATH
    composer install -vvvvv
    chown -R www-data:www-data $APP_DIRPATH
    exit 0
elif [ "$1" == "update" ] && [ "$2" == "silex" ]; then 
    cd $APP_DIRPATH
    git pull origin master
    exec $composer2 install -vvvvv
    chown -R www-data:www-data $APP_DIRPATH
    exit 0
elif [ "$1" == "update" ] && [ "$2" == "code" ]; then 
    cd $APP_DIRPATH
    git pull origin master
    chown -R www-data:www-data $APP_DIRPATH
    exit 0
elif [ "$1" == "composer" ]; then 
    cd $APP_DIRPATH
    exec $composer2 $2 -vvvvv
    chown -R www-data:www-data $APP_DIRPATH
    exit 0
fi
    

key=$1
shift
echo "Running command: $key $@"
exec $key $@
