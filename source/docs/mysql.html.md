---

heading :
    title : "MySQL"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "MySQL"
    type   : ""

category : "database"
date     : 2014-01-20
excerpt  : "MySQL"
modified : 2014-02-09
tags     : [ mysql ]
title    : "MySQL"

---

* Table of Contents
{:toc}

## Introduction

Database engine of choice is [MySQL][]. This can be installed with Homebrew

Local :

    $ brew install mysql
    $ mysql.server start

Ubuntu :

    $ mysqld --help --verbose
    $ cd /etc/mysql/my.cnf
    $ /var/log/mysql/error.log

    $ service mysql start

Access to the production database is through [PHPMyAdmin][]

* Currently using MySQL
    * Create an EER and always update this:
      [EER Example](http://net.tutsplus.com/tutorials/databases/visual-database-creation-with-mysql-workbench/)
    * Suggest we use MySQL Workbench for all DB activities
      [MySQL Workbench](http://www.mysql.com/products/workbench/)

## Code Standards

* Tables should be InnoDB
* Lowercase, non-plural names separated by underscores if required.
* Column names should be non-plural - separated by underscores if required. i.e. energy_match
* Tables should contain by default
    * timestamp_create, timestamp_update, status timestamp_create and timestamp_update should be unix timestamps, int (10)
    * status provides a quick way for CMS operators to quickly remove content with no code change
    * all queries therefore need where status=1

## MySQL Backup and Maintenance

We can use the following script to automate some MySQL tasks
[MySQL Maintenance](https://github.com/mmerian/MySQL-Maint)

The mysql_maint.sh is contained within the codebase at build/bin/

This is added to the root Crontab

    sudo crontab -e

Every Twelve Hours - Do DB Backup

    0 */12 * * * /var/www/alphafounders/web/build/bin/mysql_maint.sh -b >/dev/null 2>&1

Every Twenty Four Hours - Do DB Maintenance

    0 */24 * * * /var/www/alphafounders/web/build/bin/mysql_maint.sh -m >/dev/null 2>&1

The Backup script backs up all Databases locally to ~/backup

A custom line was added to the mysql_maint.sh script to email a copy of the Master DB to certain individuals

    mutt -a /home/ubuntu/backup/mysql/127.0.0.1/alphafounders/alphafounders.latest.sql.bz2 -s "Database Backup" -- ian@alphafounders.com < /dev/null

Mutt is a simple email tool that utilises postfix. This will install Mutt and all required dependencies

    sudo apt-get install mutt

## Sharding

May come a time when there are millions of entries, users, comments and logs

* Google uses sharding, thoughts are it is based of first letter of
site; location amongst other things

We need to create a strategy early on to accomplish this too.

## Migration

Migration is the strategy of managing small changes to the database schema
Plan how we will do this with multiple people in the team

## MySQL Change Password

    mysqladmin -u root -p'root' password password
    sudo service mysql restart