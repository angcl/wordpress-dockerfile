FROM wordpress:latest

RUN pecl install xdebug
RUN apt update && apt install -y subversion mariadb-client

RUN echo zend_extension=xdebug > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo [xdebug] >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo xdebug.mode=develop,debug >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo xdebug.client_host=host.docker.internal >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo xdebug.start_with_request=yes >> /usr/local/etc/php/conf.d/xdebug.ini

RUN echo error_reporting=E_ALL > /usr/local/etc/php/conf.d/error_reporting.ini

EXPOSE 9003
