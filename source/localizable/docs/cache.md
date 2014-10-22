---
author         : Ian Warner
date           : 2014-01-20
excerpt        : "Cache"
modified       : 2014-02-09
tags           : [ cache ]
title          : Cache
small          : Cache
og:title       : Cache
og:description : Cache
og:type        : Cache
og:url         :
og:image       :
---

## Table of Contents

* Table of Contents
{:toc}

## Introduction

## Cache

* Check out DNS Prefetching
    SPDY - http://en.wikipedia.org/wiki/SPDY
* Update the .manifest version upon build

Caching can be done on many levels, choose the correct level for each requirement.

I.E. We can cache the entire front page completely, server all HTML
from a CDN such as Cloudfront. Only action is Search of this.

One cool trick is you can point 10 CNames at Cloudfront, i.e. images1.site.com, images2.site.com, etc,
and then in your application code when you generate a link to an image you can dynamically change
the domain part of the url to the ones you configured in your DNS to point at cloudfront, and that
allows for the up to 10 simultaneous connections browsers can have while downloading content.
So rather than happening sequentially, the browser can download all at the same time.

## APC

APC provides an admin interface at the root of the project this can be accessed
with the following credentials

    Host     :
    Username : apc
    password : af_apc=2013

## Slim Framework

Slim has HTTP caching support with etag,last modified and expires methods

[HTTP Caching](http://docs.slimframework.com/#HTTP-Caching-Overview)

## Other Caching Engines

* [Varnish](https://www.varnish-cache.org/)
* [Memcached](http://memcached.org/)
* [NGINX](http://nginx.org/)