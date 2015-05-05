FROM debian:jessie

#RUN groupadd -r www-data \
#  && useradd -r -g www-data www-data
RUN apt-get update && apt-get install -y curl php5-cli

RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony 

RUN mkdir -p /var/www 
RUN cd /var/www/ && symfony new symfony
RUN chown -R www-data:www-data /var/www

RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

USER www-data
CMD echo "Data-only container with bootstrapped symfony code"
CMD ls -lh /var/www/symfony