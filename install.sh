#!/bin/sh
php artisan vendor:publish --provider="Barryvdh\Debugbar\ServiceProvider"
php artisan vendor:publish --provider="Laravel\Horizon\HorizonServiceProvider"
php artisan vendor:publish --provider="Encore\Admin\AdminServiceProvider"
php artisan admin:install
php artisan queue:failed-table
php artisan migrate
php artisan ide-helper:generate
php artisan ide-helper:meta
php artisan ide-helper:models