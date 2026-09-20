FROM php:8.2-apache

RUN a2enmod rewrite
WORKDIR /var/www/html

COPY VX_WATCH_GitHub_Files.zip /tmp/vxwatch.zip
RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip \
    && unzip -q /tmp/vxwatch.zip -d /tmp/vxwatch \
    && cp -R /tmp/vxwatch/vx_flat/. /var/www/html/ \
    && chown -R www-data:www-data /var/www/html \
    && rm -rf /var/lib/apt/lists/* /tmp/vxwatch /tmp/vxwatch.zip

EXPOSE 80
