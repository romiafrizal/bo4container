FROM php:7.2.2-apache

RUN apt-get update && apt-get install -y \
        libzip-dev \
        libxslt-dev \
        zip \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libgd-dev \
        libpng-dev \
        libmcrypt-dev

RUN pecl install mongodb \
    && pecl install mcrypt-1.0.1 \
    && echo "extension=mongodb.so" > $PHP_INI_DIR/conf.d/mongodb.ini \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) bcmath \
    # && echo "extension=mongodb.so" >> $PHP_INI_DIR/php.ini \
    mysqli \
    zip \
    calendar \
    pcntl \
    shmop \
    sockets \
    xsl \
    gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 
RUN a2enmod rewrite 
EXPOSE 80
EXPOSE 443
WORKDIR /var/www/html/