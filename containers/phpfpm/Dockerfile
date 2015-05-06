FROM debian:jessie

LABEL name="Symfony2 PHP-fpm container"
LABEL version="0.1"
ENV DEBUG false

# install mandatory php packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y curl php5-common php5-cli php5-fpm php5-mcrypt php5-mysql php5-apcu php5-gd php5-imagick php5-curl php5-intl php5-xdebug

# install composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
RUN chmod a+x /usr/local/bin/composer  

# ini & conf files
COPY symfony.ini /etc/php5/fpm/conf.d/
COPY symfony.ini /etc/php5/cli/conf.d/
COPY symfony.pool.conf /etc/php5/fpm/pool.d/

# sync user and group ids with other containers
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

# start container
CMD ["php5-fpm", "-F"]
EXPOSE 9000