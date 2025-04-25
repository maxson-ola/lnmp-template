FROM php:7.2-fpm

RUN apt-get update && apt-get install -y \
    git gcc make autoconf libc-dev pkg-config libpcre3-dev \
    && docker-php-source extract \
    && git clone -b v3.4.5 --depth=1 https://github.com/phalcon/cphalcon.git /tmp/cphalcon \
    && cd /tmp/cphalcon/build && ./install \
    && docker-php-source delete \
    && rm -rf /tmp/cphalcon

# Enable the extension
RUN echo "extension=phalcon.so" > /usr/local/etc/php/conf.d/30-phalcon.ini
