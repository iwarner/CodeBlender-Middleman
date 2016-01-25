---

heading :
    small : "Nginx"
    title : "Nginx"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Nginx"
    type   : ""

category : "infrastructure"
date     : 2014-01-20
excerpt  : "Nginx"
modified : 2014-02-09
tags     : [ nginx ]

---

## Table of Contents
* Table of Contents
{:toc}

## Introduction
Move code over to use NGinx - should be faster than apache with PHPFPM

* Check that this is configured correctly., to support caching.

There is an .htaccess in the root of the project - this should be placed in the VConf file.
.htacess is a performance hit.

Run to test configuration

    nginx -t

## NGinx Configuration

Mime Types for font files should be added to mime.types

    application/x-font-ttf                ttf;
    application/x-font-opentype           otf;
    application/vnd.ms-fontobject         eot;
    application/font-woff                 woff;

Create configration file

    sudo nano /etc/nginx/sites-available/jenkins

Copy in contents

    upstream app_server
    {
        server 127.0.0.1:8080 fail_timeout=0;
    }

    server
    {
        listen      80;
        listen      [::]:80 default ipv6only=on;
        server_name jenkins.alphafounders.com;

        location /
        {
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host $http_host;
            proxy_redirect   off;

            if (!-f $request_filename) {
                proxy_pass http://app_server;
                break;
            }
        }
    }

Link File

    sudo ln -s /etc/nginx/sites-available/jenkins /etc/nginx/sites-enabled/

Restart NGINX

    sudo service nginx restart

### Change NGinx Configuration

To change something in the configuration file you change

/build/cookbooks/vagrant_main/templates/default/nginx.erb

Then you have 2 options:

    login throw ssh
    $ cd/etc/nginx/
    $ sudo nano nginx.conf - made the changes
    $ sudo service nginx restart
    $ sudo service php5-fpm restart

or

    vagrant up or (maybe) vagrant provision.

## NGinx Log Rotating

[Log Rotating](http://wiki.nginx.org/LogRotation)
[Example](http://drumcoder.co.uk/blog/2012/feb/03/nginx-and-logrotate/)

Code

    nano /etc/logrotate.d/nginx

    /var/log/nginx/*.log {
        daily
        missingok
        rotate 52
        compress
        delaycompress
        notifempty
        create 0640 www-data adm
        sharedscripts
        prerotate
                if [ -d /etc/logrotate.d/httpd-prerotate ]; then \
                        run-parts /etc/logrotate.d/httpd-prerotate; \
                fi; \
        endscript
        postrotate
                [ ! -f /var/run/nginx.pid ] || kill -USR1 `cat /var/run/nginx.pid`
        endscript
    }