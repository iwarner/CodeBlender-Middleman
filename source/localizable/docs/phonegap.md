---

heading :
    small : "Phonegap"
    title : "Phonegap"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Phonegap"
    type   : ""

category : "back-end"
date     : 2014-01-20
excerpt  : "Phonegap"
modified : 2014-02-09
tags     : [ phonegap ]

---

## Table of Contents
* Table of Contents
{:toc}

## Introduction
[PhoneGap][] is a port of [Cordova][] a platform for building native mobile
applications using HTML, CSS and JavaScript. PhoneGap essentially allows the user
to utilise the [PhoneGap Build][] to create the applications. Whereas Cordova requires
XCode to create the application for iPhone.

The Wrapper gives the application access to some of the device's native features
such as the geo-location. For a full list see the [PhoneGap Features][]

## Tutorials
* Important to use the correct tools not only to build but to debug. Read
[PhoneGap Debugging][] for a simple explanation of this process.

* [Middleman PhoneGap][] is not so much a tutorial but a codebase example.
* [PhoneGap Dashboard][] provides a decent codebase example for getting started.
* [DZone][]

## Installation
Please read initial setup also, to correctly setup node and npm on your machine.

Install the latest release through NPM

    $ npm inst cordova -g
    $ npm inst ios-sim -g
    $ npm inst plugman -g

    $ npm update cordova -g
    $ npm update ios-sim -g
    $ npm update plugman -g

    $ npm update -g

## PhoneGap Build
Utilising [PhoneGap Build][] we can build out an application for all devices in
one go. This will require uploading a Zip file or Git Push to the site and
waiting for it to compile the packages.

The package must contain a [Config XML][] file in the correct location for all
Device OS.

Please check out the [Build Starter Application][] and [Cordova Hello World][]
for further advice on this.

## PhoneGap Build API
Understanding the [PhoneGap Build API][] will make the build seamless. There is
likely a thor file in the project that will build middleman and update the project
on [PhoneGap Build][] automatically with a Zip file.

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

## Cordova Plugins

Search plugins

    $ cordova plugin search "bar"

Installed Plugins

    $ cordova plugin ls

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
Below is a simple example for creating a new application and emulating this
inside a browser for iOS, utilising the [Cordova CLI][].

### PhoneGap

    $ phonegap create tms -i "com.project.tms" -n "PROJECT"
    $ cd tms
    $ phonegap build ios

### Cordova

    $ cordova create "MyCordovaProject" com.domain.cordova "MyCordovaProject"
    $ cd MyCordovaProject
    $ cordova platform add ios
    $ cordova build
    $ cordova emulate ios --target="iPad (Retina)"

* The first argument specifies a directory to be generated, it should not already exist.
* Second argument is the domain identifier, it can be edited later in config.xml
* The last is thte application display title.

### List platforms

    $ cordova platforms ls

### Plugin Installation

    $ cordova plugin add https://github.com/kdzwinel/phonegap-estimotebeacons

### Plugin Removal

    $ phonegap local plugin remove org.apache.cordova.device
    $ phonegap local plugin remove org.apache.cordova.geolocation
    $ phonegap local plugin remove org.apache.cordova.inappbrowser
    $ phonegap local plugin remove org.apache.cordova.dialogs
    $ phonegap local plugin remove org.apache.cordova.vibration

### Build

    $ cordova build

### Emulate

    $ cordova emulate ios

## Status Bar

To remove the status bar in iOS 7 use the following entries in the plist file.

    <key>UIStatusBarHidden</key>
    <true/>
    <key>UIViewControllerBasedStatusBarAppearance</key>
    <false/>

In the configuration on XCode the following achieves the same

    set Status bar is initially hidden = YES
    add row: View controller-based status bar appearance = NO

[PhoneGap]:http://cordova.apache.org/
[Cordova]:http://cordova.apache.org/
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
[Cordova CLI]:http://cordova.apache.org/docs/en/3.5.0/guide_cli_index.md.html#The%20Command-Line%20Interface
[Plugin Registry]:http://www.plugreg.com/
[BluetoothSerial]:https://github.com/don/BluetoothSerial
[DZone]:http://refcardz.dzone.com/refcardz/getting-started-phonegap
[iOS Getting Started]:http://docs.phonegap.com/en/3.3.0/guide_platforms_ios_index.md.html#iOS%20Platform%20Guide