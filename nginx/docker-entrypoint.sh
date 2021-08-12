#!/bin/bash

php-fpm -D

echo 'start nginx'
nginx -g "daemon off;"


