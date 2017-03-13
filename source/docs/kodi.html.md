---

category : "back-end"
date     : 2014-01-20
excerpt  : "Kodi"
modified : 2014-02-09
tags     : [ kodi ]
title    : "Kodi"

---

* Table of Contents
{:toc}

## Introduction

Setup of Kodi on an Amazon Fire TV

# Fire TV

Best way to utilise the buffer and storage on an
[Amazon Fire TV 2nd Generation](https://developer.amazon.com/public/solutions/devices/fire-tv/docs/device-and-platform-specifications).

## Fire TV 2nd Generation

RAM     - 2GB
Storage - 8GB

## Kodi

Some specific speeds up :

- Disable RSS feed
- Timezone
- Enable AirPlay

## Salts

Select SYSTEM
Select Add-Ons
Select Install from zip file
Select fusion
Select xbmc-repos
Select english
repository.tknorris.release-x.x.x.zip

## Save

Android Android/data/org.xbmc.kodi/files/.kodi/userdata/ (see note)

## ADB

Install [Android Studio](https://developer.android.com/studio/install.html)
to have access to the ADB command line methods.

Follow the connection [adb to fire](https://developer.amazon.com/public/solutions/devices/fire-tv/docs/connecting-adb-to-fire-tv-device)
instructions

Get the IP address for the Fire TV

    - Device - About - Network

**Commands**

    - $adb devices
    - $adb kill-server
    - $adb start-server
    - $adb connect 192.168.1.11

**Install an Application**

    - $ adb install -r /Users/ianwarner/Dropbox/Service\ Files/Kodi/Applications/kodi-17.1-Krypton_rc1-arm64-v8a.apk

**Configure GUI Settings and Save**

    http://kodi.wiki/view/Settings#Settings_levels

**Install User Setting**

    - $ adb push /Users/ianwarner/Dropbox/Service\ Files/Kodi/userdata/guisettings.xml /sdcard/android/data/org.xbmc.kodi/files/.kodi/userdata
    - $ adb pull /sdcard/Android/data/org.xbmc.kodi/files/.kodi/userdata/guisettings.xml /Users/ianwarner/Dropbox/Service\ Files/Kodi/userdata/guisettings.xml

    http://kodi.wiki/view/Settings#Advanced_settings

    - $ adb push /Users/ianwarner/Dropbox/Service\ Files/Kodi/userdata/advancedsettings.xml /sdcard/android/data/org.xbmc.kodi/files/.kodi/userdata
    - $ adb pull /sdcard/Android/data/org.xbmc.kodi/files/.kodi/userdata/advancedsettings.xml /Users/ianwarner/Dropbox/Service\ Files/Kodi/userdata/advancedsettings.xml

**Backup settings**

Backup the whole Kodi setting to the DropBox folder

    - $ adb pull /sdcard/Android/data/org.xbmc.kodi/files/.kodi/ /Users/ianwarner/Dropbox/Service\ Files/Kodi
    - $ adb push /Users/ianwarner/Dropbox/Service\ Files/Kodi /sdcard/Android/data/org.xbmc.kodi/files/.kodi/

**Trakt**

    - $ adb push /Users/ianwarner/Dropbox/Service\ Files/Kodi/addons/script.trakt /sdcard/Android/data/org.xbmc.kodi/files/.kodi/addons/
