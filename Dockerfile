FROM php:8.0-fpm
# install composer
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    vim \
    libpq-dev \
    && docker-php-ext-install pdo_mysql pdo_pgsql \
    && docker-php-ext-install opcache

# install node.js & mpn & composer
RUN curl -sL https://deb.nodesource.com/setup_16.x  | bash - && apt-get -y install nodejs
RUN cd /usr/bin && curl -s http://getcomposer.org/installer | php && ln -s /usr/bin/composer.phar /usr/bin/composer
WORKDIR /var/www/html/my-laravel-app/
