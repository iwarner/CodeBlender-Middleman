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

TVAddons website is now defunkt

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

- $ adb devices
- $ adb kill-server
- $ adb start-server
- $ adb connect 192.168.1.11 
- $ adb connect 192.168.1.32

**Update Kodi**

http://mirrors.kodi.tv/releases/android/arm64-v8a/kodi-17.3-Krypton-arm64-v8a.apk
http://bit.ly/2rXirrw

**Install an Application**

- $ adb install -r ~/Dropbox/Service\ Files/Kodi/Applications/kodi-17.1-Krypton_rc1-arm64-v8a.apk

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

@see https://seo-michael.co.uk/how-to-install-and-setup-trakt-on-kodi-krypton/

- $ adb push /Users/ianwarner/Dropbox/Service\ Files/Kodi/addons/script.trakt /sdcard/Android/data/org.xbmc.kodi/files/.kodi/addons/

Update Trackt.py
$ adb pull /sdcard/Android/data/org.xbmc.kodi/files/.kodi/addons/plugin.video.exodus/resources/lib/modules/trakt.py /Users/ianwarner/Dropbox/Service\ Files/Kodi
$ adb push /Users/ianwarner/Dropbox/Service\ Files/Kodi/trakt.py /sdcard/Android/data/org.xbmc.kodi/files/.kodi/addons/plugin.video.exodus/resources/lib/modules/

**Salts**

- $ adb push /Users/ianwarner/Dropbox/Service\ Files/Kodi/Repos/repository.k3l3vra-1.0.1.zip /sdcard/Android/data
- $ adb push /Users/ianwarner/Dropbox/Service\ Files/Kodi/Repos/repository.tknorris.beta-1.0.6.zip /sdcard/Android/data
- $ adb push /Users/ianwarner/Dropbox/Service\ Files/Kodi/Repos/repository.exodus-2.0.0.zip /sdcard/Android/data

**Exodus from Source**
@see https://addonhq.com/alternatives-exodus-kodi/

$ adb push /Users/ianwarner/Dropbox/Service\ Files/Kodi/Repos/Exodus_3.1_Full/script.exodus.artwork-1.0.5.zip /sdcard/Android/data
$ adb push /Users/ianwarner/Dropbox/Service\ Files/Kodi/Repos/Exodus_3.1_Full/script.exodus.metadata-1.0.0.zip /sdcard/Android/data
$ adb push /Users/ianwarner/Dropbox/Service\ Files/Kodi/Repos/Exodus_3.1_Full/script.module.metahandler-2.0.3.zip /sdcard/Android/data
$ adb push /Users/ianwarner/Dropbox/Service\ Files/Kodi/Repos/Exodus_3.1_Full/script.module.urlresolver-3.0.32.zip /sdcard/Android/data
$ adb push /Users/ianwarner/Dropbox/Service\ Files/Kodi/Repos/Exodus_3.1_Full/plugin.video.exodus-3.1.15.zip /sdcard/Android/data
$ adb push /Users/ianwarner/Dropbox/Service\ Files/Kodi/Repos/Exodus_3.1_Full/repository.exodus-2.0.0.zip /sdcard/Android/data

