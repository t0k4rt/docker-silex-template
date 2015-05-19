#!/bin/bash
set -e 
shopt -s nocasematch

echo "Running command: $@"


if [ "$1" == "setup" ] && [ "$2" == "sf2" ]; then 
    cd /var/www
    if  [ -d "/var/www/symfony/web" ]; then
        printf "\x1b[93;41m symfony project already exists \x1b[0m \n";
        exit 0
    fi
    echo $SF2_VERSION
    echo $SF2_REPO
    echo $@ 
    git clone -b $SF2_VERSION --depth 1 $SF2_REPO symfony
    cd symfony
    cp app/config/parameters.yml.dist app/config/parameters.yml
    UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
    sed -r -e "s|(^.*database_host:).*$|\1 $POSTGRES_HOST|;\
        s|(^.*database_port:).*$|\1 $POSTGRES_PORT|;\
        s|(^.*database_user:).*$|\1 $POSTGRES_USER|;\
        s|(^.*database_password:).*$|\1 $POSTGRES_PASSWORD|;\
        s|(^.*secret:).*$|\1 $UUID|;" app/config/parameters.yml
    
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
elif [[ $1 == *":"* ]] && php /var/www/symfony/app/console list|grep $1; then
	echo "Found command(s)"; 
    PREFIX="php /var/www/symfony/app/console " 
    exec gosu www-data bash -c "$PREFIX$@"
    exit 0    
fi
exec $@
