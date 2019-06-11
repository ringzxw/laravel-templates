#!/bin/sh
composer update
cd database/migrations
shopt -s extglob
rm -rf !(2014_10_12_000000_create_users_table.php|2014_10_12_100000_create_password_resets_table.php)
shopt -u extglob
cd ..
cd ..
rm -rf app/Admin
rm -rf public/vendor
php artisan vendor:publish --provider="Encore\Admin\AdminServiceProvider"
php artisan admin:install
php artisan jwt:secret --force
php artisan ide-helper:generate
php artisan ide-helper:meta
php artisan ide-helper:models -no
composer dumpautoload