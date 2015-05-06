FROM nginx

ADD symfony.conf /etc/nginx/conf.d/

# helpful for debug
# CMD ["ls", "-l", "/dev"]
# CMD ["ls", "-l", "/var/log/nginx"]
# CMD ["cat", "/etc/nginx/nginx.conf"]

RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data
