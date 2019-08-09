FROM php:7.2-fpm

COPY ./ext /tmp/ext
WORKDIR /tmp/ext
#ENV EXTENSIONS=",${PHP_EXTENSIONS},"
ENV EXTENSIONS=",pdo_mysql,intl,xdebug,redis,gettext,soap,"

RUN apt-get update \
    && apt-get install -y locales \
    && echo -e '\n227 231\n1' | dpkg-reconfigure locales \
    && chmod +x install.sh\
    && sh install.sh \
    && rm -rf /tmp/ext
