FROM debian:jessie

RUN apt-get update && apt-get install -y nginx

ADD symfony.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/symfony.conf /etc/nginx/sites-enabled/symfony

# RUN echo "upstream php-upstream { server phpfpm:9000; }" > /etc/nginx/conf.d/upstream.conf

RUN usermod -u 1000 www-data

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
EXPOSE 443