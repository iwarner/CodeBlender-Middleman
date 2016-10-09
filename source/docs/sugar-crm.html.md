---

heading :
    title : "Sugar CRM"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Sugar CRM"
    type   : ""

category : "business"
date     : 2014-01-20
excerpt  : "Sugar CRM"
modified : 2014-02-09
tags     : [ sugarcrm, crm ]
title    : "Sugar CRM"

---

* Table of Contents
{:toc}

## Introduction

[Sugar CRM](http://www.sugarcrm.com/)

## Installing Sugar CRM

[Installation Guide](http://support.sugarcrm.com/02_Documentation/01_Sugar_Editions/05_Sugar_Community_Edition/Sugar_Community_Edition_6.5/Sugar_Community_Edition_Installation_Guide_6.5.0)
[Ubuntu Setup](http://www.e79.ca/blog/linux/installing-sugarcrm-6-5-ce-on-ubuntu-12-04-amd64/)

Download

    $ wget http://downloads.sourceforge.net/project/sugarcrm/1%20-%20SugarCRM%206.5.X/SugarCommunityEdition-6.5.X/SugarCE-6.5.13.zip

Unzip

    $ unzip SugarCE-6.5.13.zip
    $ rm SugarCE-6.5.13.zip

Move

    $ mv SugarCE-Full-6.5.13/ /var/www/crm.alphafounders.com

Permissions

    $ sudo chown -R www-data:www-data /var/www/crm.alphafounders.com

## Requirements

[Sugar CRM 6.5.x Requirements](http://support.sugarcrm.com/05_Resources/03_Supported_Platforms/Sugar_6.5.x_Supported_Platforms)

Basically a configured LAMP system is required

## Apache Configuration

### Writeable Folders

    $ sudo chmod -R 775 /var/www/crm.alphafounders.com/cache
    $ sudo chmod -R 775 /var/www/crm.alphafounders.com/custom
    $ sudo chmod -R 775 /var/www/crm.alphafounders.com/data
    $ sudo chmod -R 775 /var/www/crm.alphafounders.com/modules
    $ sudo chmod 774 /var/www/crm.alphafounders.com/config.php
    $ sudo chmod 774 /var/www/crm.alphafounders.com/config_override.php
    $ sudo chmod 774 /var/www/crm.alphafounders.com/sugarcrm.log

### VirtualHost

    $ sudo nano /etc/apache2/sites-available/crm.alphafounders.com

    <VirtualHost *:80>
        ServerAdmin  it@alphafounders.com
        DocumentRoot /var/www/crm.alphafounders.com
        ServerName   crm.alphafounders.com
        ServerAlias  54.251.179.123
    </VirtualHost>

    <Directory /var/www/crm.alphafounders.com/>
        AllowOverride All
    </Directory>

### Enable Site

    $ sudo a2ensite crm.alphafounders.com
    $ sudo a2dissite 000-default

### Reload

    $ sudo service apache2 reload

## Email Configuration

Sugar CRM requires an email solution to send and also receive email into the system

Gmail can be used as an SMTP gateway or one can be set up on the server.

[Mail Server](https://help.ubuntu.com/community/MailServer)
[Postfic](https://help.ubuntu.com/community/Postfix) is the mail transport engine of choice for Ubuntu

To edit configuration

    $ sudo nano /etc/postfix/main.cf

## Sugar Schedulers

Sugar CRM requires some CRON activity to be scheduled

    $ sudo crontab -e -u www-data
    * * * * *    cd /var/www/crm.alphafounders.com; php -f cron.php > /dev/null 2>&1