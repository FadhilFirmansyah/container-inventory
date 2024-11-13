FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    git \
    curl \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libicu-dev \
    libzip-dev \ 
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure zip \ 
    && docker-php-ext-install gd pdo pdo_mysql intl zip 

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html