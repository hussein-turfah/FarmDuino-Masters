#!/bin/bash

composer install && sleep 10 && php artisan migrate --force && php artisan db:seed && php artisan serve --host=0.0.0.0
