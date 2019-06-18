#!/bin/sh
apt-get update
echo "---------- Install pdo_mysql ----------"
docker-php-ext-install pdo_mysql

# if [ -z "${EXTENSIONS##*,redis,*}" ]; then
#     echo "---------- Install redis ----------"
#     mkdir redis \
#     && tar -xf redis-4.1.1.tgz -C redis --strip-components=1 \
#     && ( cd redis && phpize && ./configure && make ${MC} && make install ) \
#     && docker-php-ext-enable redis
# fi
echo "---------- Install redis ----------"
mkdir redis \
&& tar -xf redis-4.1.1.tgz -C redis --strip-components=1 \
&& ( cd redis && phpize && ./configure && make && make install ) \
&& docker-php-ext-enable redis

echo "---------- Install gettext ----------"
docker-php-ext-install gettext

echo "---------- Install intl ----------"
apt-get install -y libicu-dev
docker-php-ext-install intl