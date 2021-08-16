##
# MALL
# php 7.4
# Support Magento2 Version
# 2.4.3
##

FROM php:7.4-fpm

RUN apt-get update && apt-get install -y sendmail cron curl zip unzip zlib1g-dev libpng-dev libjpeg-dev libwebp-dev libfreetype6-dev libxpm-dev libcurl4-openssl-dev libxml2-dev libonig-dev libxslt1-dev libzip-dev; \
    # Clean up
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*; \
    #
    chmod 755 /var/spool/mqueue-client; \
    # Install Composer
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"; \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"; \
    php composer-setup.php; \
    php -r "unlink('composer-setup.php');"; \
    mv composer.phar /usr/local/bin/composer; \
    # magento2 扩展配置
    docker-php-source extract; \
    docker-php-ext-configure zip --with-libzip; \
    docker-php-ext-configure gd --with-jpeg --with-xpm --with-webp --with-freetype; \
    docker-php-ext-install bcmath; \
    docker-php-ext-install ctype; \
    docker-php-ext-install curl; \
    docker-php-ext-install dom; \
    docker-php-ext-install gd; \
    docker-php-ext-install hash; \
    docker-php-ext-install iconv; \
    docker-php-ext-install intl; \
    docker-php-ext-install mbstring; \
    docker-php-ext-install openssl; \
    docker-php-ext-install pdo_mysql; \
    docker-php-ext-install simplexml; \
    docker-php-ext-install soap; \
    docker-php-ext-install xsl; \
    docker-php-ext-install zip; \
    docker-php-ext-install sockets; \
    docker-php-source delete
