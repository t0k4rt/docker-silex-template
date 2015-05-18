FROM debian:jessie

LABEL name="Symfony2 PHP-fpm container"
LABEL version="0.1"

# PHP env var
ENV DEBUG false
# Symfony env var
ENV TAG 2.6 
ENV REPO https://github.com/symfony/symfony-standard.git

# install mandatory php packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y git curl php5-cli php5-mcrypt php5-apcu php5-gd php5-imagick php5-curl php5-intl php5-pgsql

# sync user and group ids with other containers
RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data
