---

author         : Ian Warner
title          : Testing
small          : Testing
date           : 2001-03-31
tags           : [ testing ]
og:title       : Testing
og:description : Testing
og:type        : Testing
og:url         :
og:image       :

---

## Table of Contents
* Table of Contents
{:toc}

## Introduction
Cloud instances can be created from a CHEF script, this same script can
be used to create Vagrant / VirtualBox VMs that can be used directly on
the developers machine.

This creates a system where each developer is working independently
and possibly remotely on a system that is identical to the production
machines.

## Vagrant
Vagrant utilises VirtualBox to create VMs from a script. Utilising
Chef Solo we can automate the installation and running of a wide range
of scenarios.

Vagrant can be used to bring up several VMs on the local machines to
replicate the full production infrastructure.

* Create Scripts based on the current production setup.
* [Vagrant Tutorial](http://iostudio.github.com/LunchAndLearn/2012/03/21/vagrant.html)
* [Vagarant Boxes](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Boxes)
* [Vagrant on Windows](http://www.enrise.com/2012/12/git-and-vagrant-in-a-windows-environment/)

To poweroff a started vagrant machine thats perhaps in error

    VBoxManage controlvm VMNAME poweroff

## Installation

### Download Box

    $ sudo vagrant box add Precise64 http://files.vagrantup.com/precise64.box

Use the below to cache certain downloads Vagrant will make when preparing a box.

[Cache Downloads](https://github.com/avit/vagrant-apt_cache)

Elastic Search

* [Elastic Search with Chef Solo](http://www.elasticsearch.org/tutorials/2012/03/21/deploying-elasticsearch-with-chef-solo.html)
* [Configuration](http://www.elasticsearch.org/guide/reference/setup/configuration.html)

Location on production server

    ~/software/elasticsearch

## Scripting

[Chef Resources](http://wiki.opscode.com/display/chef/Resources)

## Cookbooks

* [Apt](http://community.opscode.com/cookbooks/apt)                         : 1.7.0
* [Build Essential](http://community.opscode.com/cookbooks/build-essential) : 1.3.2
* [Database](http://community.opscode.com/cookbooks/database)               : 1.3.8
* [ElasticSearch](http://community.opscode.com/cookbooks/elasticsearch)     : 0.1.0
* [ImageMagick](http://community.opscode.com/cookbooks/imagemagick)         : 0.2.2
* [JAVA](http://community.opscode.com/cookbooks/java)                       : 1.7.0
* [MySQL](http://community.opscode.com/cookbooks/mysql)                     : 2.1.0
* [Nginx](http://community.opscode.com/cookbooks/nginx)                     : 1.1.2
* [Ohai](http://community.opscode.com/cookbooks/ohai)                       : 1.1.6
* [OpenSSL](http://community.opscode.com/cookbooks/openssl)                 : 1.0.0
* [PHP](http://community.opscode.com/cookbooks/php)                         : 1.1.4
* [PHP-FPM](http://community.opscode.com/cookbooks/php-fpm)                 : 0.3.0
* [RUnit](http://community.opscode.com/cookbooks/runit)                     : 0.16.2

Would be nice to document also what version of each software the above cookbooks will install.

## Connecting to DB

    mysql -uroot -ppassword

Provide details on client connection

## Todo
* Check out [Berk Shelf](http://berkshelf.com/) more
* MySQL My.conf in build folder
* Sort out nginx conf
* Elastic Search conf
* PHP Conf
* Check out the installation of a chef server - maybe cookbooks remain up to date then