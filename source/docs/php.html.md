---

heading :
    title : "PHP"

meta :
    title  : "PHP - CodeBlender"

category : "back-end"
date     : 2014-01-20
excerpt  : "PHP"
modified : 2014-02-09
tags     : [ php ]
title    : "PHP"

---

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

### In-line

~~~php
ini_set( 'post_max_size',       '64M' );
ini_set( 'upload_max_filesize', '64M' );
~~~

### .htaccess

~~~apacheConf
php_value upload_max_filesize 40M
php_value post_max_size 42M
~~~

## Profiling

* [FORP][]

What versions are we running on the servers

## Code Standards

Please read the below site

* [PHP Fig](http://www.php-fig.org/)

Specifically

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

#### PHP 5.4

If there are any pre-existing pear install outside of homebrew-php, and you are
using a non-standard pear.conf location, installation may fail.

For 10.5 and Apache:
    Apache needs to run in 32-bit mode. You can either force Apache to start
    in 32-bit mode or you can thin the Apache executable.

To enable PHP in Apache add the following to httpd.conf and restart Apache:
    LoadModule php5_module /usr/local/Cellar/php54/5.4.6/libexec/apache2/libphp5.so

The php.ini file can be found in:
    /usr/local/etc/php/5.4/php.ini

PEAR

If pear complains about permissions, 'Fix' the default PEAR permissions and config:
    chmod -R ug+w /usr/local/Cellar/php54/5.4.6/lib/php
    pear config-set php_ini /usr/local/etc/php/5.4/php.ini

Extensions

If you are having issues with custom extension compiling, ensure that this php is
in your PATH:
    PATH="$(brew --prefix josegonzalez/php/php54)/bin:$PATH"

Extensions will never be compiled against this homebrew-php PHP. Please install them
using --with-homebrew-php to enable compiling against this php.

FPM

If you have installed the formula with --with-fpm, to launch php-fpm on startup:
    * If this is your first install:
        mkdir -p ~/Library/LaunchAgents
        cp /usr/local/Cellar/php54/5.4.6/homebrew-php.josegonzalez.php54.plist ~/Library/LaunchAgents/
        launchctl load -w ~/Library/LaunchAgents/homebrew-php.josegonzalez.php54.plist

    * If this is an upgrade and you already have the homebrew-php.josegonzalez.php54.plist loaded:
        launchctl unload -w ~/Library/LaunchAgents/homebrew-php.josegonzalez.php54.plist
        cp /usr/local/Cellar/php54/5.4.6/homebrew-php.josegonzalez.php54.plist ~/Library/LaunchAgents/
        launchctl load -w ~/Library/LaunchAgents/homebrew-php.josegonzalez.php54.plist

Mountain Lion comes with php-fpm pre-installed, to ensure you are using the brew version you need to make sure /usr/local/sbin is before /usr/sbin in your PATH:

  PATH="/usr/local/sbin:$PATH"

You may also need to edit the plist to use the correct "UserName".

Please note that the plist was called 'org.php-fpm.plist' in old versions of this formula.

## Todo

* More notes on profiling, debugging, set up and standards required.

[PHP: Hypertext Preprocessor]:http://php.net/
[Wiki page]:http://en.wikipedia.org/wiki/PHP
[FORP]:http://anthonyterrien.com/forp/
[Jose Gonzalez]:https://github.com/josegonzalez/homebrew-php