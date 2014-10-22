---

author         : Ian Warner
title          : Middleman
small          : Middleman
date           : 2001-03-31
tags           : [ middleman ]
og:title       : Middleman
og:description : Middleman
og:type        : Middleman
og:url         :
og:image       :

---

## Table of Content
* Table of Contents
{:toc}

## Introduction
Logging is the concept of creating entries for each user action, what
the request and response once and the success of this. Logging should
also encompass exceptions and other levels of code debug.

Logging can and will consume large amounts of storage - consider using
Mongo or Redis for this.

Simply push and forget, then create system to collate and report on.
This could be enhanced to a real time system.

## Slim Framework Trace / Log
Check out the way Slim does this

[Slim Logging](http://docs.slimframework.com/#Overview)