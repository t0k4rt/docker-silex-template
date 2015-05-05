FROM nginx

ADD symfony.conf /etc/nginx/conf.d/
#RUN ls -l /etc/nginx/
RUN ls -l /dev
RUN ls -l /var/log/nginx
#RUN cat /etc/nginx/conf.d
#RUN cat /etc/nginx/nginx.conf
#RUN ln -s /etc/nginx/sites-available/symfony.conf /etc/nginx/sites-enabled/symfony
RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data
