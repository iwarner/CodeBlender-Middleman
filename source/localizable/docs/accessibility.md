---
author         : Ian Warner
date           : 2014-01-20
excerpt        : "HERE WER ARE"
modified       : 2014-02-09
tags           : [ accessibility, standards ]
title          : Accessibility
small          : Accessibility
og:title       : Accessibility
og:description : Accessibility
og:type        : accessibility
og:url         :
og:image       :
---

## Table of Contents

* Table of Contents
{:toc}

## Introduction

[Accessibility][] (WCAG) is crucial for both the website and the mobile apps.
The full [W3C Guidelines 2008][] can be found here and the older
[W3C Guidelines 1999][]

These include users who have visual, physical or age-related limitations that prevent
them from fully seeing or using a touchscreen, and users with hearing loss who may
not be able to perceive audible information and alerts.

An itemised checklist of the main points for the web can be found at [W3C Chcklist][].
As usual Wikipedia is a good place to start to understand the history of [WCAG][].
For extra resources please see [Mobile Resources][]

The caveat is that the user must enable the accessibility services on the device
they are engaged with. This could be a mobile, tablet or desktop device.

### High Level Goals

* Set up and use the application without sighted assistance.
* All task workflows in the application can be easily navigated using directional
controls and provide clear and appropriate feedback

## Organisations

[RNIB][]
[Action Hearing Loss][]

## Screen Readers

Emulating screen readers is important for testing the Web Version of the TMS
project.

The softwarre is mostly geared towards windows users, but through virtualisation
or emulation we can achieve a good result through a Mac

Please read [Screen Reader Testing][] tutorial for more information.

http://etc.usf.edu/techease/4all/web-accessibility/using-the-fangs-screen-reader-emulator/

## Key Device Accessibility Services

* Text-to-speech
* Haptic feedback
* Gesture navigation
* Trackball
* Directional-pad navigation

## iOS

Please read the [Accessibility iOS][] documentation for an overview and
[Testing Accessibility iOS][] on how to test accessibility points.
And the more generic [Marketing iOS][] text

### iOS Barclays App Testing

Firstly switched on the default setting for VoiceOver - equivalent of TalkBack in Android.
Testing Barlcays Banking Application

Two finger swipe down explains all elements on the page.

* App Name is simply Banking so not desriptive enough. Should be "Barclays Banking"
* Open Up and again states "Banking"
* Clicking on buttons VoiceOver states "Button Name" then "Type" i.e. Button
* When an Alert (popup) opens VoiceOver states "Alert" and then "Name of first button"
  or if it is a textual Alert then reads the whole message.
* They have a CALL button that once clicked goes straight to the call service.
  This I guess is important for the visually impaired.
* Issue exists that if I select with one tap an entity i.e. button, when I double tap
  anywhere ( select ) it fires that selection. This is probably then a standard.
* Passcode entry is not that great - no initial prompts on what the page is.
  Clicking on boxes just gives a beep
* Clicking on the keypad I get a prompt stating "passcode 1 button" so some guidance there
  This seems to be a custom keyboard though
* When waiting Loader appears VoiceOver states "Please Wait"
* Incorrect passcode gives alert - Title = Ep1, could be more descriptive, but message is read
  and is useful.
* Scolling the sliding panel states "Rows 5-10 of 17" useful
  Getting rid of the sliding panel is a pain as the user needs to find the more button again

So the Barclays app seems to work very nicelt with VoiceOver for iPhone

* Tested Red Laser - the two finger swipe for the home page took about 10 minutes due
  to the amount of content needed to be read back - important to note this for
  offers. Setting the labels and titles for elements can be shortened for VoiceOver.

## Android

Please read the [Accessibility Android][] a checklist can be found here
[Android Accessibility Checklist][]

### Minimum Accessibility

* Directional control - use the app without the touch screen
* TalkBack audio prompts -
* Explore by Touch prompts -
* Touchable control sizes
* Gestures work with TalkBack enabled
* No audio-only feedback

### Android Current App Testing

* Splash Screen - Announce name of the application with TallBack - Togetherbank, so name important - check annunciation
* General
    * Selecting elements wit one click and then double clicking anywhere will force that interaction ie back or input box filling in
      Not sure if this is preferred behaviour.
* Login Screen
    * Email Input - States "Input Box : Email Address"
    * Clicking on same region does not repeat message
    * Password Input - States "Input Box" - Should state Password also
    * Look at android:hint fields
    * Partially filling the box in; clicking off then returning states the new value and not the original requirement.
    * Error message on form issue is good
    * Error on Password states "Unknown error please try again" - should be specific to password issue.
    * Brand Logos have incorrect labeling - Amazon = "button 36 Unlabeled" - goes to Learn More
* Learn More
    * States Together Bank again - should be a title here for the correct page.
    * Carousels should be avoided especially on the device
        * There are no TalkBack prompts at all - to tell the user it is a carousel.
    * Brand Logos have incorrect labeling - Amazon = "button 36 Unlabeled"
    * Back button states "Navigate Up"
* Forgot Password
    * States Together Bank again - should be a title here for the correct page.
    * Form ok
* Sign Up
    * Accessing form fields is a little tricky - make larger
    * None of the text / inputs gives TakBack Prompts
    * Help inside of input fields are not great - clicking the help does not read the text back
      and this text is not accessible to be prompted back either.
    * Deselection issue, picks the last one active instead of one clicked.
    * Faqs link too small - button
    * Terms link too small - button
    * No prompts on errors encountered - cant select error messages
* FAQ Page
    * No Talk Back Prompts
    * Deselection issue, picks the last one active instead of one clicked.

## Articles

[UK Legal Requirements][]

## Audits

Some disability organisations offer site audits such as the [RNIB Audit][]

http://www.rosiesherry.com/2012/09/02/ios-accessibility-a-useful-guide-for-testing/
http://patstapestry.wordpress.com/2013/05/24/tips-for-accessibility-testing-of-ios-apps/

## Todo

* More info on mobile checklist for accessibility.
* http://www.w3.org/TR/wai-aria/roles
* http://www.w3.org/TR/WCAG20/
* http://blog.paciellogroup.com/2012/06/using-aria-in-html/

[Accessibility]:http://www.w3.org/WAI/
[WCAG]:http://en.wikipedia.org/wiki/Web_Content_Accessibility_Guidelines
[W3C Guidelines 2008]:http://www.w3.org/TR/WCAG20/
[W3C Guidelines 1999]:http://www.w3.org/TR/WAI-WEBCONTENT/
[W3C Chcklist]:http://www.w3.org/TR/WAI-WEBCONTENT/full-checklist.html
[Accessibility iOS]:https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/iPhoneAccessibility/Introduction/Introduction.html
[Testing Accessibility iOS]:https://developer.apple.com/library/ios/technotes/TestingAccessibilityOfiOSApps/TestingtheAccessibilityofiOSApps/TestingtheAccessibilityofiOSApps.html
[Marketing iOS]:https://developer.apple.com/technologies/ios/accessibility.html
[Accessibility Android]:http://developer.android.com/guide/topics/ui/accessibility/index.html
[Android Accessibility Checklist]:http://developer.android.com/guide/topics/ui/accessibility/checklist.html
[UK Legal Requirements]:http://www.webcredible.co.uk/user-friendly-resources/web-accessibility/uk-website-legal-requirements.shtml
[RNIB Audit]:http://www.rnib.org.uk/professionals/webaccessibility/services/siteaudits/Pages/site_audits.aspx
[Mobile Resources]:http://www.iheni.com/mobile-accessibility-guidelines/
[RNIB]:http://www.rnib.org.uk/
[Action Hearing Loss]:http://www.actiononhearingloss.org.uk/
[Screen Reader Testing]:http://www.iheni.com/screen-reader-testing/