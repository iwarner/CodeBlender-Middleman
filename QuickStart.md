# Project

## Middleman

    $ ~/Dropbox/www/DryKiss/codeblender.net/www
    $ sudo bundle exec middleman server -p 80

## Kill Middleman

    $ ps aux | grep middleman
    $ sudo kill -9 7309

## PHP Server

    $ ~/Dropbox/www/DryKiss/codeblender.net/www/source
    $ php -S localhost:8080

    $ sudo nano /usr/local/etc/php/5.4/php.ini

## Composer

    $ brew install josegonzalez/php/composer
    $ composer create-project laravel/laravel --prefer-dist
    $ composer update
    https://packagist.org/packages/stripe/stripe-php

## Bower

    $ bower update && bower prune

## BitBucket

    git@bitbucket.org:TriangleSolutions/codeblender.net.git

    $ ~/Dropbox/www/DryKiss/codeblender.net/www/source
    $ git remote add origin git@bitbucket.org:TriangleSolutions/codeblender.net.git
    $ git push -u origin --all
    $ git push -u origin --tags