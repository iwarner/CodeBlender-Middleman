---

author         : Ian Warner
date           : 2014-01-20
excerpt        : "Accessibility"
modified       : 2014-02-09
tags           : [ accessibility, standards ]
title          : Accessibility
small          : Accessibility
og:title       : Accessibility
og:description : Accessibility
og:type        :
og:url         :
og:image       :

---

## Table of Contents
* Table of Contents
{:toc}

## Introduction
In the case of code exceptions occurring an alerting policy should be produced.

This section is a natural follow on from [[Logging]]. As it is the logging that
will fire the alerts.

## Levels
As we utilise [Slim Framework][] for the back end architecture we should follow
the log levels stated within this.

* Fatal - System is unusable
* Error - Immediate action required
* Warn  - Warning conditions
* Info  - Normal but significant
* Debug - Debug information set by developer

The log writer in Slim can be extended to process the alerts we require based
on the level we encounter.

## Actions
The following actions should occur when a log level is encountered by the system.
All previous actions should also be performed.

So a Fatal error will require, logging, email, SMS and pushing site into
maintenance mode. This may occur for instance if the database is no longer
accessible.

* Fatal
    * Set site into maintenance mode
* Error
    * Send SMS to IT team
* Warn
    * Email it@alphafounders.com
* Info
    * Log into the database
* Debug
    * No action required

Be advised that there needs to be some buffering on messages sent out. For
instance a piece of code could generate many fatal errors in a single scenario.
Sending out ten SMS is not advised.

## Server Monitoring

Sometimes it may not be possible to send alerts out via code, if the service is
actually crippled. This is where we need to monitor server health.

For servers hosted at Amazon we can set-up [AWS CloudWatch][]

### Tools

* [Open NMS][]
* [CopperEgg][]
* [Rackspace Monitoring][]
* [Monit][]
* [Nagios][]

## Email

Use Mutt to send out alerting emails

```bash
$ echo "This is the body" | mutt -s "Hello Ian" -- it@alphafounders.com < /dev/null
```

## SMS

Find a cheap SMS provider to send to Thai phones.

[Slim Framework]:http://docs.slimframework.com/#Log-Levels
[AWS CloudWatch]:http://aws.amazon.com/cloudwatch/
[Open NMS]:http://www.opennms.org/
[CopperEgg]:http://copperegg.com/
[Rackspace Monitoring]:http://www.rackspace.com/cloud/public/monitoring/
[Monit]:http://mmonit.com/monit/
[Nagios]:http://www.nagios.org/