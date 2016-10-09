---

heading :
    small : ""
    title : "Apache"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Apache"
    type   : ""

category : "server"
date     : 2014-01-20
excerpt  : "Apache"
modified : 2014-02-09
tags     : [ apache, ubuntu ]
title    : "Apache"

---

* Table of Contents
{:toc}

## Introduction

Apache is a first class web server. This file outlines some maintenance operations
for local Mac usage and Ubuntu.

## Configuration file

    $ cd /etc/apache2
    $ nano apache2.conf
    $ nano httpd.conf

    # Include generic snippets of statements
    Include conf.d/

    # Include the virtual host configurations:
    Include sites-enabled/

If problems arise try remove sites from the config to eliminate bugs in scripts

## MPM configuration

List compiled in modules

    $ apache2 -l

Check for the prefork.c module to know what section of the configuration to modify

## Server maintenance

Change user to root sudo -s

Usage: service < option > | --status-all | [ service_name [ command | --full-restart ] ]

    $ sudo service apache2 restart

## 

scp ~/.ssh/rackspace/id_rsa.pub iwarner@31.222.162.170

http://cbracco.me/ssh-keys/
    ssh-add -K ~/.ssh/rackspace/id_rsa

### Log files

Log files by standard are stored in this

    $ cd /var/log/apache2

View the last 100 entries of a log file

    $ tail -100 /var/log/apache2/access.log
    $ tail -100 /var/log/apache2/error.log

Log file removal

    $ df -h
    $ du -hs
    $ du -a /var | sort -n -r | head -n 100

    $ cd "/var/www/storage/logs"
    $ sudo rm -vi /var/www/storage/logs/*

    $ rm -vi /var/log/apache2/*ls -al

    $ find . -name "*.gz" -type f
    $ find . -name "*.gz" -type f -delete

https://www.a2hosting.com/kb/developer-corner/apache-web-server/viewing-apache-log-files

## Common errors

child process XXX still did not exit

http://stackoverflow.com/questions/19891440/django-mod-wsgi-apache2-child-process-xxx-still-did-not-exit-sending-a-si












Usage: service < option > | --status-all | [ service_name [ command | --full-restart ] ]
iwarner@WebServer:~$ sudo apache2ctl --help
Usage: /usr/sbin/apache2ctl start|stop|restart|graceful|graceful-stop|configtest|status|fullstatus|help
       /usr/sbin/apache2ctl <apache2 args>
       /usr/sbin/apache2ctl -h            (for help on <apache2 args>)
iwarner@WebServer:~$ sudo apache2ctl -h
Usage: /usr/sbin/apache2 [-D name] [-d directory] [-f file]
                         [-C "directive"] [-c "directive"]
                         [-k start|restart|graceful|graceful-stop|stop]
                         [-v] [-V] [-h] [-l] [-L] [-t] [-T] [-S] [-X]
Options:
  -D name            : define a name for use in <IfDefine name> directives
  -d directory       : specify an alternate initial ServerRoot
  -f file            : specify an alternate ServerConfigFile
  -C "directive"     : process directive before reading config files
  -c "directive"     : process directive after reading config files
  -e level           : show startup errors of level (see LogLevel)
  -E file            : log startup errors to file
  -v                 : show version number
  -V                 : show compile settings
  -h                 : list available command line options (this page)
  -l                 : list compiled in modules
  -L                 : list available configuration directives
  -t -D DUMP_VHOSTS  : show parsed settings (currently only vhost settings)
  -S                 : a synonym for -t -D DUMP_VHOSTS
  -t -D DUMP_MODULES : show all loaded modules
  -M                 : a synonym for -t -D DUMP_MODULES
  -t                 : run syntax check for config files
  -T                 : start without DocumentRoot(s) check
  -X                 : debug mode (only one worker, do not detach)
Action '-h' failed.
The Apache error log may have more information.
