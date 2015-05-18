FROM debian:jessie
#FROM php:5.6-cli

# get gosu
#RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
#RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
#RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture)" \
#	&& curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture).asc" \
#	&& gpg --verify /usr/local/bin/gosu.asc \
#	&& rm /usr/local/bin/gosu.asc \
#	&& chmod +x /usr/local/bin/gosu
#RUN apt-get purge -y --auto-remove curl
    
# sync user and group ids with other containers
RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

# create and mount volume
RUN mkdir -p /var/www /var/www/symfony && chown -R www-data:www-data /var/www/symfony 
VOLUME /var/www/symfony
CMD echo "Container for symfony code ready"