FROM php:7.2-fpm

COPY ./ext /tmp/ext
WORKDIR /tmp/ext
#ENV EXTENSIONS=",${PHP_EXTENSIONS},"
ENV EXTENSIONS=",pdo_mysql,intl,xdebug,redis,gettext,"

RUN apt-get update \
    && apt-get install -y locales
    && echo -e '\n221 225\n1' | dpkg-reconfigure locales 
    && chmod +x install.sh\
    && sh install.sh \
    && rm -rf /tmp/ext
