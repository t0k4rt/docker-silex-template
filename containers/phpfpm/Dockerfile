FROM debian:jessie

LABEL name="Silex PHP-fpm container"
LABEL version="0.1"

# install mandatory php packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y git curl php5-fpm php5-cli php5-fpm php5-mcrypt php5-apcu php5-gd php5-imagick php5-curl php5-intl php5-pgsql php5-xdebug
# install composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
# get gosu
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture)" \
	&& curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture).asc" \
	&& gpg --verify /usr/local/bin/gosu.asc \
	&& rm /usr/local/bin/gosu.asc \
	&& chmod +x /usr/local/bin/gosu


# ini & conf files
COPY conf/silex.ini /etc/php5/fpm/conf.d/
COPY conf/silex.ini /etc/php5/cli/conf.d/
COPY conf/silex.pool.conf /etc/php5/fpm/pool.d/

# sync user and group ids with other containers
RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

# copy entrypoint file
COPY ./entrypoint.sh /

RUN chmod +x /entrypoint.sh

# set entry point
ENTRYPOINT [ "/entrypoint.sh" ]

# start container
CMD ["php5-fpm", "-F"]
EXPOSE 9000