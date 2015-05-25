FROM debian:jessie

# sync user and group ids with other containers
RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

# create and mount volume
RUN mkdir -p /var/www /var/www/app && chown -R www-data:www-data /var/www/app 
VOLUME /var/www/app
CMD echo "Container for silex code ready"