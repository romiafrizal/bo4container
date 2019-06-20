FROM php:7.2.19-fpm
MAINTAINER Romi Afrizal <romi.afrizal@live.com>

RUN apt-get update && apt-get install -y \
        openssl libssl-dev libcurl4-openssl-dev 

RUN pecl install mongodb \
    && echo "extension=mongodb.so" > $PHP_INI_DIR/conf.d/mongodb.ini \
    && docker-php-ext-install bcmath 


# RUN php -m