FROM php:7.2-fpm

COPY ./ext /tmp/ext
WORKDIR /tmp/ext
#ENV EXTENSIONS=",${PHP_EXTENSIONS},"
ENV EXTENSIONS=",pdo_mysql,intl,xdebug,redis,gettext,"

RUN chmod +x install.sh\
    && sh install.sh \
    && rm -rf /tmp/ext