#!/bin/sh
if [ -z "${EXTENSIONS##*,pdo_mysql,*}" ]; then
    echo "---------- Install pdo_mysql ----------"
    docker-php-ext-install pdo_mysql
fi

if [ -z "${EXTENSIONS##*,intl,*}" ]; then
    echo "---------- Install intl ----------"
    apt-get install -y libicu-dev\
    && docker-php-ext-install intl
fi

if [ -z "${EXTENSIONS##*,xdebug,*}" ]; then
    echo "---------- Install xdebug ----------"
    pecl install xdebug
    # mkdir xdebug \
    # && tar -xf xdebug-2.6.1.tgz -C xdebug --strip-components=1 \
    # && ( cd xdebug && phpize && ./configure && make) \
    # && cp ./modules/xdebug.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718/xdebug.so
    #&& docker-php-ext-enable xdebug
fi

if [ -z "${EXTENSIONS##*,redis,*}" ]; then
    echo "---------- Install redis ----------"
    mkdir redis \
    && tar -xf redis-4.1.1.tgz -C redis --strip-components=1 \
    && ( cd redis && phpize && ./configure && make && make install ) \
    && docker-php-ext-enable redis
fi

if [ -z "${EXTENSIONS##*,gettext,*}" ]; then
    echo "---------- Install gettext ----------"
    docker-php-ext-install gettext
fi
