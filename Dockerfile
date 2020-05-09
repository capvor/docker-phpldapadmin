FROM alpine:3.11

# https://github.com/helphi/Dockerfile-phpldapadmin-alpine/blob/master/1.2.3/Dockerfile
# https://github.com/jaguardev/docker-phpldapadmin/blob/master/Dockerfile

# docker build -t capvor/phpldapadmin:0.1 .
# docker run --name myphpldapadmin -p 19680:80 --net test-tier capvor/phpldapadmin:0.1


RUN apk --no-cache --update add php7-apache2 phpldapadmin && \
    rm -rf /var/www/localhost/htdocs && \
    ln -sf /usr/share/webapps/phpldapadmin/htdocs/ /var/www/localhost/ && \
    cp /etc/phpldapadmin/config.php.example /etc/phpldapadmin/config.php

EXPOSE 80

CMD ["httpd","-D","FOREGROUND"]
