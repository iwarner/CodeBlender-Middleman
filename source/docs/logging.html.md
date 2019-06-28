---

category : "infrastructure"
date     : 2014-01-20
excerpt  : "Logging"
modified : 2014-02-09
tags     : [ logging ]
title    : "Logging"

---

* Table of Contents
{:toc}

## Introduction

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
