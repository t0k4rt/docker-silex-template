FROM debian:jessie

# sync user and group ids with other containers
RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

# create and mount volume
RUN mkdir -p /var/www /var/www/silex && chown -R www-data:www-data /var/www/silex 
VOLUME /var/www/silex
CMD echo "Container for silex code ready"