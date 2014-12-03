---

author         : Ian Warner
title          : Analytics
small          : Analytics
date           : 2001-03-31
modified       : 2014-02-09
tags           : [ analytics ]
og:title       : Analytics
og:description : Analytics
og:type        :
og:url         :
og:image       :

---

## Table of Contents

* Table of Contents
{:toc}

## Introduction

## Browser Stats
Office for National Statistics Publications
http://www.ons.gov.uk/ons/publications/index.html?pageSize=50&sortBy=none&sortDirection=none&newquery=internet

W3 Schools
http://www.w3schools.com/browsers/browsers_stats.asp

Browser Stats
2014    Internet Explorer   Firefox Chrome  Safari  Opera
January 10.2 %              26.9 %  55.7 %  3.9 %   1.8 %

OS Platform Statistics
2014    Win8    Win7    Vista   NT*    WinXP   Linux   Mac   Mobile
January 13.4%   55.3%   1.5%    0.3%   11.0%   4.9%    9.6%  4.0%

2014    Total   iOS *   Android Others
January 4.00 %  1.23 %  1.93 %  0.84 %

Intelligent Positioning have conducted a poll of mobile traffic share, compared
to desktop traffic share over the course of 2013. We used our rich Analytics
data, affording us data comprised of over 175 million visits in 2013 for the survey.

http://www.intelligentpositioning.com/blog/2014/01/mobile-and-tablet-traffic-set-to-overtake-desktop-by-mid-2014/

Mobile Marketing
http://www.smartinsights.com/mobile-marketing/mobile-marketing-analytics/mobile-marketing-statistics/

Responsive Design Infographic
http://monetate.com/infographic/responsive-design-the-next-great-hope-or-all-hype/

Browser Infographics
http://monetate.com/infographic/browser-wars-the-end-or-just-the-beginning/

Desktop vs Mobile Engagement
http://www.comscore.com/Insights/Press_Releases/2012/5/Introducing_Mobile_Metrix_2_Insight_into_Mobile_Behavior

General Mobile Usage from Google
http://www.gstatic.com/ads/research/en/2011_TheMobileMovement.pdf

Location based services
http://www.pewinternet.org/2012/05/11/three-quarters-of-smartphone-owners-use-location-based-services/

Share of Web Borwsers - Wikipedia
http://en.wikipedia.org/wiki/Usage_share_of_web_browsers

Smartphone Usage Stats
http://en.wikipedia.org/wiki/Smartphone#Market_share

Smartphone Browsers
http://en.wikipedia.org/wiki/Mobile_browser#Popular_mobile_browsers

Future Browser decisions
http://www.unwiredview.com/2013/11/21/android-4-4-kitkat-ships-without-browser-app-oems-have-to-license-chrome-or-build-their-own/
This could mean more browser testing in future on all mobile devices

Grouping Phones
http://jquerymobile.com/gbs/1.4/

Testing
http://www.quirksmode.org/webkit_mobile.html#t01

Android Devices
http://www.androidcentral.com/devices

Marketing and sales both need full exposure to the life cycle of a user visit on
the AskHanuman website.

This includes :

* Tracking user events, i.e. click on buttons, carousels
* Submitting the form and viewing the Thank you page, Goal
* Campaigns, understanding where the user came from and what goals and events they achieved

* Find out about the Analytics Requirements
* Complete sections

Investgiate the best analytics to use for the reporting required.

There are many more tools than [Google Analyitcs](http://www.google.co.uk/analytics/)
out there, some provide realtime reporting.

* Determine analytics for mobile devices. [https://testflightapp.com/](TestFlight)
offers an SDK for this

## Google Analytics

Log the google analytics identifier for each project here
GA identifier is - UA-

### Administrator access to the profiles

### Events

Setting up events requires some coding in the JS

    _gaq.push(['_trackEvent', 'category', 'action', 'opt_label', 'opt_value', 'opt_noninteraction']);

    category
    The name you supply for the group of objects you want to track.

    action
    A string that is uniquely paired with each category, and commonly used to
    define the type of user interaction for the web object.

For instance to track the Car Insurance Form we could use the following:

    _trackEvent("CI", action, opt_label, opt_value, opt_noninteraction)

## Database Stats

Create a page that lists some arbitrary stats
I.e. Orders over the past week, by day.

## Considerations

* Currently the analytics is at the top of the page - review this:
    * [Analytics Placement](https://developers.google.com/analytics/devguides/collection/gajs/gaTrackingOverview)
* I believe there are two analytics included in the pages
* Check out Goals and Events for certain actions - i.e. Order