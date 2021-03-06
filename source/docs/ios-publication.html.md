---

category           : "developer"
comment            : true
date               : 2016-07-08
description        : "Publish iOS platform applications"
excerpt            : "Publish iOS platform applications"
image              : "http://blog.deliveroo.co.uk/wp-content/uploads/sites/2/2016/11/Facebook-Banner-Sweet_treats_Felicity_Millward_October-29-of-29.jpg"
lang               : en
modified           : 2016-07-08
published          : true
tags               : [ apple, ios, developer ]
time               : "12:55pm"
title              : "Publish iOS platform applications"
twitterDescription : "Publish iOS platform applications"
type               : "article"

---

* Table of Contents
{:toc}

# Publish iOS platform applications

## Introduction

This article outlines the process to publish a Cordova iOS application to the
Apple store. It assumes that Cordova and relevant iOS SDKs have been setup and
configured. These are briefly bulleted below.

- A Mac - unfortunately this is required to run the Apple software needed
    - Mavericks
- iOS device(s), recommended over the emulator to fully test the application
- Install Xcode from the Mac App Store, and Command line tools
    - $ xcode-select --install
- $ npm install -g cordova
- $ npm install -g ios-sim
- $ npm install -g ios-deploy
- $ cordova platform add ios --save

Add any cordova plugins necessary.

## Distribution quick start

Following Apple's [distribution quick start]()

In the first instances of development you likely just want to get your app
running locally on your USB connected iOS device. Luckily this is also a step
into getting it into the Apple store.

Note you do not need an Apple developer account for deployment onto a local device.

- Add Apple ID to Xcode
- Signing identities
- Provisioning profiles
- Verify access to your developer account
- Launch app on connected iOS device
- Enable app services, such as iPay
- Back up signing identities

## Naming an application

The following fields will be required

- Product Name            : Cordova Test
- Organisation name       : DryKISS Ltd
- Organisation identifier : com.drykiss.cordovatest
    - After an app is available on the store, its bundle ID can't be changed.
- Language                : Objective C
- Devices                 : Universal

## Add Apple ID to Xcode

- Open Xcode
- Choose Xcode > Preferences
- At the top of the window, click Accounts
- In the lower-left corner, click the Add button (+)
- Choose Add Apple ID from the pop-up menu

## Distribution workflow

- Enroll in the Apple developer program

Selecting the best workflow for your team depends on the nature of the development.
Creating a Hybrid cross-platform app

https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppDistributionGuide/Introduction/Introduction.html

## Exporting for Testing

https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppDistributionGuide/TestingYouriOSApp/TestingYouriOSApp.html#//apple_ref/doc/uid/TP40012582-CH8

## Submitting the application

https://taco.visualstudio.com/en-us/docs/tutorial-package-publish-readme/#package-the-ios-version-of-your-app
https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppDistributionGuide/SubmittingYourApp/SubmittingYourApp.html#//apple_ref/doc/uid/TP40012582-CH9
https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingProfiles/MaintainingProfiles.html#//apple_ref/doc/uid/TP40012582-CH30-SW991

Check connected devices

    $ ios-deploy -c

Run in X-Code to generate certificate

    $ cordova build ios
    $ bundle exec middleman build --clean && cordova run --device

    $ cordova build ios --release
    @see http://stackoverflow.com/questions/24061063/how-can-i-deploy-create-ipa-iphone-app-using-cordova-build-ios-release

## Useful links

- [iOS Platform Guide]()


[iOS Platform Guide]:https://cordova.apache.org/docs/en/latest/guide/platforms/ios/
[distribution quick start]:https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppStoreDistributionTutorial/Introduction/Introduction.html#//apple_ref/doc/uid/TP40013839
