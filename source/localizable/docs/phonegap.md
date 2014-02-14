---
author         : Ian Warner
title          : Phonegap
small          : Phonegap
date           : 2001-03-31
tags           : [ phonegap, mobile ]
og:title       : Phonegap
og:description : Phonegap
og:type        : Phonegap
og:url         :
og:image       :
---

## Table of Contents
* Table of Contents
{:toc}

## Introduction
[PhoneGap][] wraps an HTML, CSS and Javascript build into a native mobile
application. Utilising the devices web browser. This gives the application
access to some of the device's native features such as the geo-location.
For a full list see the [PhoneGap Features][]

[PhoneGap][] is preferred over Cordova as it allows access to [PhoneGap][] build.

## Tutorials
* Important to use the correct tools not only to build but to debug. Read
[PhoneGap Debugging][] for a simple explanation of this process.

* [Middleman PhoneGap][] is not so much a tutorial but a codebase example.
* [PhoneGap Dashboard][] provides a decent codebase example for getting started.
* [DZone][]

## Installation
Please read initial setup also.
Install the latest release through NPM

    $ sudo npm install -g phonegap
    $ sudo npm install -g cordova

## PhoneGap Build
Utilising [PhoneGap Build][] we can build out the prototype for all devices in
one go. This will require uploading a Zip file to the site and waiting for
it to compile the packages.

The package must contain a [Config XML][] file in the correct location for all
Device OS.

Please check out the [Build Starter Application][] and [Cordova Hello World][]
for further advice.

## PhoneGap Build API
Understanding the [PhoneGap Build API][] will make the build seemless. There is
already a thor file in the project that will build middleman and update the project
on [PhoneGap Build][].

Token - will prompt for your Adobe password

    $ curl -u iwarner@triangle-solutions.com -X POST -d "" https://build.phonegap.com/token | python -mjson.tool

User details

    $ curl https://build.phonegap.com/api/v1/me?auth_token=Token | python -mjson.tool

## PhoneGap Plugins
To enable native functionality within the application, you must whitelist the
required plugins. Please check out the [PhoneGap Plugins][] page for an overview
of the plugins available, and then [Available Plugins][] for the complete set.

Plugins can be referenced by version also.

Libraries of Plugins can be found by third party developers, a central repository
of these is located at [Plugin Registry][].

Plugins of note:

* [BluetoothSerial][]

Use Plugman
http://cordova.apache.org/docs/en/edge/plugin_ref_plugman.md.html

How to write a Plugin
http://cordova.apache.org/docs/en/edge/plugin_ref_spec.md.html

## iOS
Check out the [iOS Developer Center][] for the latest news and updates on iOS
technology.

Read the PhoneGap [iOS Getting Started][] guide

## Android
Although we are not directly building through the [Android SDK][] it is important to
keep up with what is happening in this space.

## Command Line
Below is a simple example for creating a new PhoneGap application and emulating
this inside a browser for iOS, utilising the [Cordova CLI][].

    $ phonegap create tms -i "com.visa.tms" -n "TMS"
    $ cd tms
    $ phonegap build ios

    $ cordova create tms com.visa.tms "TMS"
    $ cd hello
    $ cordova platform add ios
    $ cordova build
    $ cordova emulate ios

Plugin Installation

    $ phonegap local plugin add org.apache.cordova.device
    $ phonegap local plugin add org.apache.cordova.geolocation
    $ phonegap local plugin add org.apache.cordova.inappbrowser
    $ phonegap local plugin add org.apache.cordova.dialogs
    $ phonegap local plugin add org.apache.cordova.vibration

    $ cordova plugin add https://github.com/kdzwinel/phonegap-estimotebeacons

Plugin Removal

    $ phonegap local plugin remove org.apache.cordova.device
    $ phonegap local plugin remove org.apache.cordova.geolocation
    $ phonegap local plugin remove org.apache.cordova.inappbrowser
    $ phonegap local plugin remove org.apache.cordova.dialogs
    $ phonegap local plugin remove org.apache.cordova.vibration

Plugin List

    $ phonegap local plugin list

Build

    $ phonegap build ios

Emulate

    $ phonegap run ios --emulate
    $ phonegap install android

### Mobile Partials
* Touch Icons - need the full set of icons to be placed in here
* Icon Well - Need to make sure the Hit Box is fills up the available space around the icon.

## Todo
* Should be renamed to Mobile
* Change over to use PhoneGap and not Cordova command lines options
* Complete the sections
* Check out https://github.com/phonegap/ios-sim more
* http://www.mikedellanoce.com/2012/09/10-tips-for-getting-that-native-ios.html
* http://phonegap-tips.com/
* Set up gotchas section - ie -webkit-touch-callout property to none
* https://github.com/triceam/Walkable-App
* http://devgirl.org/2013/09/05/phonegap-3-0-stuff-you-should-know/
* http://www.icenium.com/cordova-phonegap-mobile-app-development/sample-apps
* http://www.tricedesigns.com/2012/01/17/mobile-web-phonegap-html-dev-tips/
* http://www.html5rocks.com/en/mobile/touch/
* http://maker.github.io/ratchet
* https://github.com/h5bp/mobile-boilerplate/tree/master/doc
* http://k33g.github.io/2011/12/30/IOS5-WEBAPP-TWITTER-BOOTSTRAP.html
* http://www.tricedesigns.com/2013/01/18/my-workflow-for-developing-phonegap-applications/

[PhoneGap]:http://cordova.apache.org/
[PhoneGap Features]:http://phonegap.com/about/feature/
[PhoneGap Debugging]:http://www.slideshare.net/iivanoo/mobile-applications-development-lecture-9#btnNext
[Middleman PhoneGap]:https://github.com/pixelsonly/middleman-phonegap
[PhoneGap Dashboard]:https://github.com/jsmiff/simple-phonegap-dash
[PhoneGap Build]:https://build.phonegap.com
[PhoneGap Build API]:https://build.phonegap.com/api
[Android SDK]:http://developer.android.com/develop/index.html
[iOS Developer Center]:https://developer.apple.com/devcenter/ios/index.action
[Config XML]:https://build.phonegap.com/docs/config-xml
[Build Starter Application]:https://github.com/phonegap/phonegap-start
[Cordova Hello World]:https://github.com/apache/cordova-app-hello-world/tree/master
[PhoneGap Plugins]:https://build.phonegap.com/docs/plugins-using
[Available Plugins]:https://build.phonegap.com/plugins
[Cordova CLI]:http://cordova.apache.org/docs/en/3.0.0/guide_cli_index.md.html
[Plugin Registry]:http://www.plugreg.com/
[BluetoothSerial]:https://github.com/don/BluetoothSerial
[DZone]:http://mobile.dzone.com/category/tags/phonegap
[iOS Getting Started]:http://docs.phonegap.com/en/3.3.0/guide_platforms_ios_index.md.html#iOS%20Platform%20Guide