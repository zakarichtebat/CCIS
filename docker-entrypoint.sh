#!/bin/bash

if [ ! -f "vendor/autoload.php" ]; then
    composer install --no-progress --no-interaction
fi

if [ ! -f ".env" ]; then
    echo "Creating env file for env $APP_ENV"
    cp .env.example .env
fi

role=${CONTAINER_ROLE:-app}

if [ "$role" = "app" ]; then
    php artisan migrate
    php artisan key:generate
    php artisan optimize
    php artisan cache:clear
    php artisan config:clear
    php artisan route:clear
    php artisan view:clear
    php-fpm

elif [ "$role" = "queue" ]; then
    echo "Running the queue..."
    php artisan queue:work --verbose --tries=3 --timeout=90

elif [ "$role" = "scheduler" ]; then
    while [ true ]
    do
      php artisan schedule:run --verbose --no-interaction &
      sleep 60
    done
else
    echo "Could not match the container role \"$role\""
    exit 1
fi 