---

category : "business"
date     : 2014-01-20
excerpt  : "Search"
modified : 2014-02-09
tags     : [ search ]
title    : "Search"

---

* Table of Contents
{:toc}

## Introduction

Search for a website can be a complex or simple procedure. Utilising Google
Search enables a simple snippet of HTML to be placed on the site and Google will
do the heavy lifting. However the results are limited to the pages Google already
has indexed.

Using software like Elastic Search, enables a programmatic search API for the site.
A lot more complex but highly configurable and bespoke.

Creating a JavaScript search for a static site requires the index to be generated
in JSON at build time.

## Google Search

## JavaScript Search

Add Lunr in here

## Elastic Search

[Elastic Search](http://www.elasticsearch.org/)

http://www.elasticsearch.org/guide/reference/api/admin-indices-analyze.html
http://www.elasticsearch.org/guide/reference/index-modules/analysis/word-delimiter-tokenfilter.html

### Search Elastic Search Directly

    $ curl http://localhost:9200/insurance/_search?q="KPMG"

### Setup

[Structure](http://www.elasticsearch.org/guide/reference/setup/dir-layout.html)

### Commands

Start Elastic Search

    $ sudo rcelasticsearch start

Without the Service Wrapper

    Start : ./elasticsearch/bin/elasticsearch -p pidfile
    Stop  : kill `cat pidfile`

Check that Elastic Search is Running

    $ sudo rcelasticsearch status

### Process

In order to be able to do pagination we need to create Elastica_Query object
as it's the only one who'd be able to hold 'from' parameter see this
[Discussion](https://github.com/ruflin/Elastica/pull/208)

### Install the Service Wrapper

    $ curl -L http://github.com/elasticsearch/elasticsearch-servicewrapper/tarball/master | tar -xz

    $ mv ~/elasticsearch-elasticsearch-servicewrapper-d47d048/service /usr/local/elasticsearch-0.20.1/bin/

    $ rm -Rf ~/elasticsearch-elasticsearch-servicewrapper-d47d048

* Configuration

    $ sudo nano /usr/local/elasticsearch-0.20.1/bin/service/elasticsearch.conf

* Setup ElasticSearch as a service:

    $ ./usr/local/elasticsearch-0.20.1/bin/service/elasticsearch start | stop | restart

* Set up rcelasticsearch as a shortcut to the service wrapper:

    $ sudo bash /usr/local/elasticsearch-0.20.1/bin/service/elasticsearch install
    $ sudo ln -s `readlink -f /usr/local/elasticsearch-0.20.1/bin/service/elasticsearch` /usr/local/bin/rcelasticsearch
