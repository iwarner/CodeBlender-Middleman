---

heading :
    small : "PHP"
    title : "PHP"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "PHP"
    type   : ""

category : "back-end"
date     : 2014-01-20
excerpt  : "PHP"
modified : 2014-02-09
tags     : [ php ]

---

<!-- ## Table of Contents
* Table of Contents
{:toc}

## Introduction
[PHP: Hypertext Preprocessor][] is a server side scripting language. For more info
please see the Wiki page.

## Installation
Utilising homebrew it is easy to get the latest version of PHP, using the great
work by [Jose Gonzalez][]

~~~bash
$ brew update
$ brew tap josegonzalez/homebrew-php
$ brew install php54 php54-apc php54-mcrypt
~~~

## INI File
PHP stores all its configuration information inside a ini file. The location of
this file can be found with

~~~bash
$ php -r "phpinfo();  " | grep -i "loaded configuration file"
~~~

Configuration changes can also be supplied in the code and inside an .htaccess file

### Inline
~~~php
ini_set( 'post_max_size',       '64M' );
ini_set( 'upload_max_filesize', '64M' );
~~~

### .htaccess
~~~apache
php_value upload_max_filesize 40M
php_value post_max_size 42M
~~~

## Profiling
* [FORP][]

What versions are we running on the servers

## Code Standards

Please read the below site

* [PHP Fig](http://www.php-fig.org/)

Specifially

* [PSR-0](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-0.md)
* [PSR-1](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-1.md)
* [PSR-2](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-2.md)

## Unit Testing

* [Behat](http://behat.org/)
* [PHP Unit](https://github.com/sebastianbergmann/phpunit/)

The Jenkins server will provide automated test passes and report on issues

## Image Magick

Source: php-imagick
Version: 3.1.0~rc1-1

## Installation

TODO Upgrade PEAR and PECL

We use ImageMagick images on the server side.

Install PHP5 - PHP-FPM

    sudo apt-get install php5-cli
    sudo apt-get install php5-suhosin
    sudo apt-get install php5-fpm
    sudo apt-get install php5-cgi
    sudo apt-get install php5-curl
    sudo apt-get install php-pear
    sudo apt-get install php-apc
    sudo apt-get install php5-xdebug

    sudo pecl install imagick

    sudo service php5-fpm start

    sudo nano /etc/php5/fpm/php-fpm.conf

    pm                   = dynamic
    pm.max_children      = 8
    pm.start_servers     = 2
    pm.min_spare_servers = 2
    pm.max_spare_servers = 3
    pm.max_requests      = 500

## Todo
* More notes on profilling, debugging, setup and standards required.

[PHP: Hypertext Preprocessor]:http://php.net/
[Wiki page]:http://en.wikipedia.org/wiki/PHP
[FORP]:http://anthonyterrien.com/forp/
[Jose Gonzalez]:https://github.com/josegonzalez/homebrew-php -->