---

heading :
    small : "Desktop applications"
    title : "Desktop applications"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Desktop applications"
    type   : ""

category : "back-end"
date     : 2014-01-20
excerpt  : "Desktop applications"
modified : 2014-02-09
tags     : [ desktop ]
title    : "Desktop applications"

---

* Table of Contents
{:toc}

## Introduction

The aim of this document is to investigate the available options for building a
desktop app using HTML5, JavaScript and CSS.

There are many applications that provide this functionality, some utilising node
and

## Ideas
* Idea is to have a dashboard for each employee in the Studio.
* This dashboard will contain the following tools, dependant on the logged in user.
* Can control work station set up and environments.
* Middleman front end - backs on to lan network server or local node setup and mongo. Mac only at the moment.
* Log in is Via Facebook Connect.
* Create specific project templates - such as Wordpress / Middleman - done by network administered Thor files.
* [Instant Chat messenger](https://github.com/gravityonmars/Balloons.IO#balloonsio)
    * Create Groups
    * Add Users
    * Bookmark specific Chats
    * Search through saved History
    * Saves links automatically
    * Code syntax highlighter
    * Emoticons
    * Topic Changes
    * Voting / Polling Initialisation
    * Tabbed Chats
    * Sending Files - Store these into history too.
    * Translations
    * Templated responses - such as Call me - posts a chat + phone number to contact on.
    * Roles and administration per user per chat / group
    * Authenticates against active directory
    * Send SMS messages based on AD mobile field
    * Installed on local intranet
* HOSTS File Editor
* Project Creation
    * Creates project with WIKI / Bugs / Chat Group
* [Cost prediction of a project](http://estimator.astuteo.com/)
* Invoicing
* Time Sheets
* Domain Management

## FRONTEND
* [Foundation](http://foundation.zurb.com/)
* [Bootstrap](http://twitter.github.com/bootstrap/)
* [Fuel UX](http://exacttarget.github.com/fuelux/)

## CONTINUOUS INTERGRATION
* [NodeJS Plugin](https://wiki.jenkins-ci.org/display/JENKINS/NodeJS+Plugin)
* [Concrete](https://github.com/ryankee/concrete)

## Testing
* [Expresso](http://visionmedia.github.com/expresso/)
* [Node Unit](https://github.com/caolan/nodeunit)
* [Benchmark JS](https://github.com/bestiejs/benchmark.js)

## Storage
* MongoDB
* [Mongoose](https://www.learnboost.com/blog/mongoose/)

## Todo
* Tide XML in middleman style
* Setup automatic build and preview for Tide
* Work out a way to exclude some folders from the build
* Set up code obfusication
* Set up a polling job to see if docs need updating.
    * Run a script to download from Github etc to update the docs if required.
* Want to ZIP up the documnetation - and on first view unzip these into the correct directory for viewing.
    * Check directory exists - if not unzip the zip file.

MacGap
https://github.com/MacGapProject/MacGap1
http://docs.macgap.com/

https://github.com/rogerwang/node-webkit
http://blog.teamthinklabs.com/index.php/2014/01/08/getting-set-up-with-node-webkit-mac-only/
http://durandaljs.com/documentation/Native-Apps-With-Node-Webkit.html
https://www.npmjs.org/package/nodewebkit
http://strongloop.com/strongblog/creating-desktop-applications-with-node-webkit/
https://github.com/mllrsohn/grunt-node-webkit-builder

https://www.tidekit.com/
http://deskshell.org/