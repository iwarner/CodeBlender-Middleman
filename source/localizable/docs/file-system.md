---
author         : Ian Warner
title          : File System
small          : File System
date           : 2001-03-31
tags           : [ file System ]
og:title       : File System
og:description : File System
og:type        : File System
og:url         :
og:image       :
---

## Table of Contents

* Table of Contents
{:toc}

## Introduction

Establishing a file structure similar to other team members is crucial in terms
of script creation and pair programming.

The main setup is that of the Library code folder.
This needs to be placed in : /var/www/Library

    $ sudo mkdir -p /var/www
    $ sudo chown -R `whoami`:staff /var/www
    $ sudo chmod -R 0755 /var/www

Simply then copy and paste the Library code into this folder. So we have

    $ cd /var/www/Library/middleman

## Todo

* Need to desacribe that the files are stored on the server and how to link these up