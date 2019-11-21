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

if [ -z "${EXTENSIONS##*,soap,*}" ]; then
    echo "---------- Install soap ----------"
    docker-php-ext-install soap
fi

if [ -z "${EXTENSIONS##*,gd,*}" ]; then
    echo "---------- Install GD ----------"
    apt-get install -y libjpeg-dev libpng-dev &&
    docker-php-ext-configure gd --with-png-dir=/sites/gd_dir --with-jpeg-dir=/sites/gd_dir &&
    docker-php-ext-install gd
fi

if [ -z "${EXTENSIONS##*,imagick,*}" ]; then
    echo "---------- Install imagick ----------"
    apt-get install -y libmagickwand-dev
    printf "\n" | pecl install imagick-3.4.4
    # mkdir imagick \
    # && tar -xf imagick-3.4.4.tgz -C imagick --strip-components=1 \
    # && ( cd imagick && phpize && ./configure && make && make install ) \
    docker-php-ext-enable imagick
fi