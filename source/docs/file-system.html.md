---

heading :
    small : "File system"
    title : "File system"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "File system"
    type   : ""

category : "developer"
date     : 2014-01-20
excerpt  : "File system"
modified : 2014-02-09
tags     : [ file-system ]

---

* Table of Contents
{:toc}

## Introduction

Establishing a file structure similar to other team members is crucial in terms
of script creation and pair programming.

The main set up is that of the Library code folder.
This needs to be placed in : /var/www/Library

    $ sudo mkdir -p /var/www
    $ sudo chown -R `whoami`:staff /var/www
    $ sudo chmod -R 0755 /var/www

Simply then copy and paste the Library code into this folder. So we have

    $ cd /var/www/Library/middleman

## CodeBlender

This is the Pattern Library container, it contains all the partials and helpers
required for all other projects.

We Symlink from the folders inside Codeblender. So it is important other projects
and other team members place CodeBlender or use a Symlink in the same place to
allow the scripts to work.

E.g.

Place Codeblender anywhere on the system then symlink using the following commands.

    $ mkdir -p /var/www
    $ sudo ln -s "PATH TO CODELENDER" /var/www/

## SSH

Edit the permissions allowed on the MAC - remove the root login ability

    $ cd /etc
    $ chmod 666 sshd_config
    $ vim sshd_config

    #PermitRootLogin no

    Remove #
    #RSAAuthentication      yes
    #PubkeyAuthentication   yes
    #AuthorizedKeysFile     .ssh/authorized_keys
    #PasswordAuthentication no
    #PermitEmptyPasswords   no

    Change to
    UsePAM no

## GIT

### User account and Login

All git commands are run from the "git" User.

    $ ssh git@uxserver.local
    $ ux.git

### Certificate Creation

Create
    $ ssh-keygen -t rsa

Mkdir should already be created on server so can ignore
    $ mkdir .ssh

Copy into the authorised keys
    $ scp ~/.ssh/id\_rsa.pub git@uxserver.local:.ssh/authorized\_keys

# CONFIGURATION
ServerAliveInterval   30
ServerAliveCountMax   4
StrictHostKeyChecking no
UserKnownHostsFile    ~/.ssh/known_hosts

# MacMini
Host mini
    HostName    uxserver.local
    User        git

### Setting Up Remote Git

In Groups create the destination folder
SSH into the server and GIT Initialise the folder

    $ cd /Groups
    $ cd Prototype
    $ cd Repositories

    * Create Folder

    $ mkdir app.tms.git
    $ mkdir bat-tool.git
    $ mkdir codeblender.git
    $ mkdir codeblender-api.git
    $ mkdir gateway-portal.git
    $ mkdir gui-on-git.git
    $ mkdir gui.git
    $ mkdir phantomjs.git
    $ mkdir prototype-scaffolding.git
    $ mkdir shared-shipping.git
    $ mkdir vme.git

    * GIT Init

    $ cd FOLDER.git
    $ git init --bare

### Setting Up Local GIT

Find a folder to store the local copy of the repo. Run the following commands
to setup the repository, add a readme file and push it to your server.

    $ git clone git@uxserver.local:/Groups/Prototype/Repositories/app.tms.git app.tms.com
    $ git clone git@uxserver.local:/Groups/Prototype/Repositories/bat-tool.git bat-tool
    $ git clone git@uxserver.local:/Groups/Prototype/Repositories/codeblender.git www
    $ git clone git@uxserver.local:/Groups/Prototype/Repositories/codeblender-api.git api
    $ git clone git@uxserver.local:/Groups/Prototype/Repositories/gateway-portal.git www
    $ git clone git@uxserver.local:/Groups/Prototype/Repositories/gui-on-git.git gui-on-git.com
    $ git clone git@uxserver.local:/Groups/Prototype/Repositories/phantomjs.git phantomJS
    $ git clone git@uxserver.local:/Groups/Prototype/Repositories/prototype-scaffolding.git prototype-scaffolding
    $ git clone git@uxserver.local:/Groups/Prototype/Repositories/shared-shipping.git shared-shipping
    $ git clone git@uxserver.local:/Groups/Prototype/Repositories/vme.git vme.com

### Mini Web Sites

    UX Portal      : http://uxserver.local
    Gateway Portal : http://169.254.100.100:8888
    BAT Tool       : http://169.254.100.100:8080/bat6

## Todo
* Need to desacribe that the files are stored on the server and how to link these up