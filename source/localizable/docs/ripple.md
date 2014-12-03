---

author         : "DryKISS"
title          : Ripple
small          : Ripple
date           : 2001-03-31
tags           : [ ripple, testing, front-end ]
og:title       : Ripple
og:description : Ripple
og:type        : Ripple
og:url         :
og:image       :

---

## Table of Contents
* Table of Contents
{:toc}

## Introduction
We utlise a local installation of [Ripple Emulator][] at the moment to test the [PhoneGap][] / [Cordova][]
instance of the mobile application.

## Install
Making sure [NodeJS][] and [NPM][] are installed running the following command will install
the [Ripple Emulator][] environment

    $ npm install -g ripple-emulator

## Starting Ripple
    $ ripple emulate --remote http://localhost

## Todo
* Add more sections including debugging and utilising all the controls on the emulator
* https://developer.blackberry.com/html5/documentation/getting_started_with_ripple_1866966_11.html

[PhoneGap]:http://phonegap.com/
[Cordova]:http://cordova.apache.org/
[Ripple Emulator]:https://npmjs.org/package/ripple-emulator
[NPM]:https://npmjs.org/
[NodeJS]:http://nodejs.org/