---
author         : Ian Warner
title          : PHP
small          : PHP
date           : 2001-03-31
tags           : [ php, server, backend ]
og:title       : PHP
og:description : PHP
og:type        : PHP
og:url         :
og:image       :
---

## Table of Contents
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

## Todo
* More notes on profilling, debugging, setup and standards required.

[PHP: Hypertext Preprocessor]:http://php.net/
[Wiki page]:http://en.wikipedia.org/wiki/PHP
[FORP]:http://anthonyterrien.com/forp/
[Jose Gonzalez]:https://github.com/josegonzalez/homebrew-php