FROM debian:jessie

LABEL name="Silex HHVM container"
LABEL version="0.1"

# Install HHVM
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 && \
    echo deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libgmp10 hhvm git curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
RUN /usr/bin/update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60

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

RUN sed -r -i.bak "s|hhvm.log.file = /var/log/hhvm/error.log|hhvm.log.file = /dev/stderr|" /etc/hhvm/server.ini 

# sync user and group ids with other containers
RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

# copy entrypoint file
COPY ./entrypoint.sh /

RUN chmod +x /entrypoint.sh

# set entry point
ENTRYPOINT [ "/entrypoint.sh" ]

# start container
CMD ["hhvm", "--mode", "server", "--user", "www-data", "-vServer.Type=fastcgi", "-vServer.Port=9000"]
EXPOSE 9000