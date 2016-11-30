---

heading :
    small : "Geolocation"
    title : "Geolocation"

meta :
    title  : "Geolocation - CodeBlender"

category : "front-end"
date     : 2014-01-20
excerpt  : "Geolocation"
modified : 2014-02-09
tags     : [ geo-location ]
title    : "Geolocation"

---

* Table of Contents
{:toc}

## Introduction

Geolocation is the identification of the real-world location of an entity, such
as a mobile phone. Geolocation may refer to the practice of assessing the
location, or to the actual assessed location.

Further information can be read on WikiPedia [Geolocation][]

[Geo-Fencing][] is a technique which involves detecting where a user is and
interacting with the defined world around that user. Google has a real world
example of [Geo-Fencing Maps][]

GPS, IP address, RFID, WiFi and Bluetooth MAC addresses, and GSM/CDMA cell IDs,
can each provide a clue to users location. Determining which to use and trust is
a matter of trade-offs in accuracy, speed, and battery-efficiency.

## iBeacon

Apple's indoor positioning system. It works through BLE (low energy bluetooth).
Any compatible Bluetooth LE iPhone or iPad can be a iBeacon transmitter.

Process could be
* Users enters store and is prompted to open the application
* User is shown bespoke offers for that individual store or store's  online portal
* User earns credits / points for using Beacon - gamification.

http://www.slideshare.net/Dusan_Writer/ibeacon-and-bluetooth-le-an-introduction
http://beekn.net/ibeacon-platforms/
http://estimote.com/
http://en.wikipedia.org/wiki/IBeacon
http://www.pocket-lint.com/news/123730-apple-s-ibeacons-explained-what-it-is-and-why-it-matters
http://www.youtube.com/watch?v=MUlYpCmtHbE
http://daveaddey.com/?p=1252
http://developer.radiusnetworks.com/2013/10/09/how-to-make-an-ibeacon-out-of-a-raspberry-pi.html
http://www.automatedhome.co.uk/apple/apple-ibeacons-explained-smart-home-occupancy-sensing-solved.html
http://gigaom.com/2013/09/17/loophole-in-ibeacon-could-let-iphones-guard-your-likes-instead-of-bombard-you-with-coupons/
http://blogs.computerworld.com/wireless-networking/22961/apple-ios-7-ibeacon-wearables-and-ble-leave-little-future-nfc
http://blog.estimote.com/post/57087873876/a-simple-way-to-simulate-apple-ios7-ibeacon-feature
http://uxmag.com/articles/the-game-changing-nature-of-beacons?utm_tone=pq&utm_content=buffer04d9e&utm_medium=social&utm_source=linkedin.com&utm_campaign=buffer
http://monetate.com/infographic/the-retailers-guide-to-solomo/

## iOS
Documentation on [GEO Location iOS][]

Seeing two prompts for [Geo Location Permission][] make sure the plugin is
installed.

## Android

Documentation on [Location Strategies Android][]

## PhoneGap
Documentation on [Geo Location PhoneGap][]

http://www.plugreg.com/plugin/textoo/BackgroundLocationEnabler

## HTML5 Location

## GPS

## Wi-Fi Location

## Accuracy

[Stack Overflow Question][] Asked

If have access to ACM DL, search "localization" & "smartphone", take a look at
most recent ones published on Mobicom, Mobisys or Sigcomm, and you get petty much
what you need.

Here's my own estimate which may not be all true:

GPS: 5m, only outdoor; IP address: >500m; RFID: unknown; WiFi: <1m as claimed,
but >10m actually, only when multiple APs exits; Bluetooth: Unknown;
MAC addresses: unknown; GSM/CDMA cell IDs: >50m

## Todo

* Put the becons into its own doc
* Complete the Sections
* Inline with analytics tags - goals and events
* Take me shopping - geo location - nearest offers - based on previous preferences or puchase history
* Look into mapping points for major shopping centers such as WestFields in london
* http://techcrunch.com/2013/08/20/steroids-js-bridges-the-performance-gap-between-phonegap-and-native-apps-by-using-native-ui-components-and-animations/
* http://www.appgyver.com/steroids
* http://www.minttwist.com/blog/2013/11/20/is-location-based-marketing-right-for-your-company/?utm_source=Digital+Marketing+Insights&utm_campaign=0a3b10b7c1-Dispatch_November_201311_29_2013&utm_medium=email&utm_term=0_3c94348a9e-0a3b10b7c1-321593853
* Complete the iBeacon elements

[Geolocation]:http://en.wikipedia.org/wiki/Geolocation
[Geo-Fencing]:http://en.wikipedia.org/wiki/Geo-fence
[Geo-Fencing Maps]:https://developers.google.com/maps/documentation/tracks/geofences
[GEO Location iOS]:https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/GettingGeographicalLocations/GettingGeographicalLocations.html
[Location Strategies Android]:http://developer.android.com/guide/topics/location/strategies.html
[Geo Location PhoneGap]:http://docs.phonegap.com/en/3.2.0/cordova_geolocation_geolocation.md.html
[Stack Overflow Question]:http://stackoverflow.com/questions/20214522/geo-location-technologies-accuracy-for-mobile
[Geo Location Permissions]:http://mobile.dzone.com/articles/seeing-two-geolocation-prompts