---

heading :
    small : "Alerting"
    title : "Alerting"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Alerting"
    type   : ""

date     : 2014-01-20
excerpt  : "Alerting"
modified : 2014-02-09
tags     : [ alerting ]

---

## Table of Contents
* Table of Contents
{:toc}

## Introduction
To start a new project you would run:

    $ composer create-project laravel/laravel --prefer-dist
    $ composer update

## Running Laravel
As long as PHP5.4 is installed on your machine you can use the PHP inbuilt server.
Installing PHP5.4+ is a snip with [Homebrew PHP][]

    $ ~/Dropbox/www/PATH
    $ php -S localhost:8080

## Laravel Setup
Laravel provides excellent database migration support. These are created through the
Artisan command line interface.

Creating a migration requires the following command:

    $ php artisan migrate:make create_retailers_table --table=retailers --create

Creating seeds for this table requires more manual effort, simply create the file
in the following folder:

    /api/app/database/seeds

To seed the database run the following command, do not do this on production more
than once as it will delete data.

    $ php artisan db:seed

Refresh all migrations and seeds

    $ php artisan migrate:refresh --seed