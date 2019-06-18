FROM php:7.2-fpm

COPY ./ext /tmp/ext
WORKDIR /tmp/ext

RUN chmod +x install.sh\
    && sh install.sh \
    && rm -rf /tmp/ext