#!/bin/bash
set -e 
shopt -s nocasematch

TODO=""
echo "command $@"


if [ "$1" == "setup" ] && [ "$2" == "sf2" ]; then 
    cd /var/www
    if  [ -d "/var/www/symfony/web" ]; then
        echo "symfony project already exists";
        exit 0
    fi
    echo $SF2_VERSION
    echo $SF2_REPO
    echo $@ 
    git clone -b $SF2_VERSION --depth 1 $SF2_REPO symfony
    cd symfony
    composer install
    rm -rf app/cache/*
    php app/console assets:install --symlink web/ 
    php app/console c:c 
    php app/console c:w 
    chown -R www-data:www-data /var/www/symfony
    exit 0
elif [ "$1" == "update" ] && [ "$2" == "sf2" ] && [ -d "/var/www/symfony/web" ]; then
    cd /var/www/symfony
    git fetch origin $3
    git checkout $3
    composer install
    php app/console assets:install --symlink web/ 
    php app/console c:c 
    php app/console c:w 
    chown -R www-data:www-data /var/www/symfony
    exit 0
elif php /var/www/symfony/app/console list|grep $1; then
	echo "found command"; 
    PREFIX="php /var/www/symfony/app/console " 
    TODO=$PREFIX$@
    #exec gosu root bash -c "ls  -l"
    exec gosu www-data bash -c "$TODO"
    exit 0    
fi

exec $@
