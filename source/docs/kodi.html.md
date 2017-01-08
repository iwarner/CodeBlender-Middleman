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

# Kodi

Best way to utilise the buffer and storage on an Amazon Fire TV 2nd Generation.


## Fire TV 2nd Generation

https://developer.amazon.com/public/solutions/devices/fire-tv/docs/device-and-platform-specifications

RAM     - 2GB
Storage - 8GB

## Kodi

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

https://developer.amazon.com/public/solutions/devices/fire-tv/docs/connecting-adb-to-fire-tv-device

adb devices

Get IP Address
System - about - network

adb kill-server
adb start-server
adb connect 192.168.1.12

adb push /Users/ianwarner/Downloads/advancedsettings.xml /sdcard/android/data/org.xbmc.kodi/files/.kodi/userdata

<advancedsettings>

    <loglevel hide="true">-1</loglevel>
    <splash>false</splash>
    <imageres>540</imageres>
    <fanartres>720</fanartres>
    <nodvdrom>true</nodvdrom>

    <network>

        <buffermode>1</buffermode>
        <cachemembuffersize>157286400</cachemembuffersize>
        <readbufferfactor>20</readbufferfactor>

    </network>

    <pvr>

        <cacheindvdplayer>true</cacheindvdplayer>
        <minvideocachelevel>50</minvideocachelevel>

    </pvr>

    <videolibrary>

        <cleanonupdate>true</cleanonupdate>
        <recentlyaddeditems>20</recentlyaddeditems>

    </videolibrary>

    <videoscanner>
        <ignoreerrors>true</ignoreerrors>
    </videoscanner>

</advancedsettings>
