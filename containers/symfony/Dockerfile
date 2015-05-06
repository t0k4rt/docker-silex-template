FROM debian:jessie

# Symfony env var
ENV TAG 2.6 
ENV REPO https://github.com/symfony/symfony-standard.git

# install dependancies
RUN apt-get update && apt-get upgrade -y && apt-get install -y git

# create and mount volume
RUN mkdir -p /var/www /var/ww/symfony
VOLUME /var/www/symfony

# clone repo with the correct tag
CMD printenv
RUN git clone --branch $TAG $REPO /var/www/symfony
RUN chown -R www-data:www-data /var/www/symfony

# sync user and group ids with other containers
RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

USER www-data
CMD echo "Data-only container with bootstrapped symfony code"
CMD ls -lh /var/www/symfony