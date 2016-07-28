---

heading :
    small : "Publishing a hybrid application"
    title : "Google Play Store"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Google Play Store, publishing a hybrid application"
    type   : "article"

category : "hybrid"
date     : 2016-07-06
excerpt  : "Google Play Store, publishing a hybrid application"
modified : 2016-07-06
tags     : [ google, hybrid, mobile ]

---

* Table of contents
{:toc}

## Introduction

Within this article we want to describe the best practices for publishing a
Hybrid application to the Google Play Store. A hybrid app is one that is created
through Cordova or Ionic for instance.

## Thor

A [Thor]() task runner command set will be created to wrap all of these
processes into some easy to remember commands. These will be listed within each
section also.

Running the thor list command in the thor folder of a CodeBlender project will
show up the specific Cordova commands.

    $ thor list

## Certification

As with most publishing to commercial stores there is always a process of
certification that must be undertook. This is sometimes called
[application signing]()

Google has the following credentials that need generating

- Identity certificate : Public key of a public/private key pair.
- Keystore : A keystore is a binary file that contains one or more private keys

You must use the same certificate throughout the lifespan of your app in order
for users to be able to install new versions as updates to the app

Most of the Google instructions point to using Android Studio to generate signed
APKs for distribution. We can also manually sign the application, see below.
This probably suits the Cordova life cycle than opening up Studio.

## Clean up

Before we build a signed version of the app, it is important to clean up the
build to remove any development artefacts. For instance the cordova console.

    $ cordova plugin rm cordova-plugin-console

Place the clean-up removal items in a build script.

## Configuration

Edit the [config.xml]() to fit the requirements of the deployed application. An
important component of this is how to manage the version number, from initial
release to how the app is updated in a cross-platform way. There are quite a
few hidden complexities to this.

## Location of APK

Cordova stores the APK in the following directory

    platforms/android/build/outputs/apk

The applications could be called something like

- android-debug.apk
- android-debug-unaligned.apk

## Manual Signing

To manually sign we should follow these steps.

Generate a private key using the keytool command :

    $ keytool -genkey -v -keystore my-release-key.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000

It will ask the following questions:

- Enter keystore password : dkCordova15
- First and last name     : Ian Warner
- Organizational unit     : DryKISS Ltd
- Organizational          : DryKISS Ltd
- City                    : London
- State                   : London
- Two letter country code : UK

This will create my-release-key.keystore

Compile the app in release mode - this generates an unsigned APK

    $ cordova build --release android

Sign the unsigned app with [JarSigner]() This should already be installed, if
your Mac has updated the JDK.

    $ jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore my_application.apk alias_name

Verify that the APK is correctly signed

    $ jarsigner -verify -verbose -certs my_application.apk

Align the APK

    $ zipalign -v 4 your_project_name-unaligned.apk your_project_name.apk

## Google Play Store

Visit the [Play store]() and complete any account registration and payment. The
fee is a modest $25 for the year.

Install the [Play console app]() to check on the go analytics of your app.

## APK upload

We can choose to upload the APK into the following buckets :

- Production
- Beta
- Alpha

## Application listing

To publish a new application on the store you will need to complete the listing
requirements. These are :

**Details**

- Title             : 12-30  characters
- Short description : 0-80   characters
- Full description  : 0-4000 characters

**Graphics**

- Screenshots
    - Phone
    - Tablet
    - TV
    - Wear

- Hi-res Icon
- Feature graphic
- Promo graphic
- TV banner
- Promo video

**Categorisation**

- Type           : Application or Game
- Category       : i.e. Tools
- Content rating : i.e. everyone

**Contact**

- Website
- Email
- Phone

**Privacy**

- Privacy Url : can choose not at this time also.

Please note that with each new app submission you will need to complete a rating
questionnaire.

You may save this as a draft at anytime.

## Helpful links

- [Cordova guide]()
- [Ionic guide]()

[Thor]:http://whatisthor.com/
[Cordova guide]:https://cordova.apache.org/docs/en/latest/guide/platforms/android/index.html
[Ionic guide]:http://ionicframework.com/docs/guide/publishing.html
[application signing]:https://developer.android.com/studio/publish/app-signing.html
[JarSigner]:http://docs.oracle.com/javase/6/docs/technotes/tools/windows/jarsigner.html
[config.xml]:http://cordova.apache.org/docs/en/latest/config_ref/index.html
[Play store]:https://play.google.com/apps/publish/signup/
[Play console app]:https://play.google.com/store/apps/details?id=com.google.android.apps.playconsole
