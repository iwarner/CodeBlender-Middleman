---

heading :
    small : "Front end"
    title : "Front end"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Front end"
    type   : ""

category : "front-end"
date     : 2014-01-20
excerpt  : "Front end"
modified : 2014-02-09
tags     : [ front-end ]
title    : "Front end"

---

* Table of Contents
{:toc}

## Introduction

This document hopes to outline some of the design concepts from a development
point of view. Highlighting design patterns that can be engineered to provide
reusable widgets.

## Off Canvas

[Off Canvas][]

## JS Framework

* Decide upon using Backbone or framework such as Angular or custom
* Use Jasmine or some other BDD testing suite for JS
* Need to implement a View Cleaning script for backbone - take note that this
  should also clean child views correctly also.

## SCSS

http://www.feedthebot.com/pagespeed/optimize-css-delivery.html

* Sort out the naming conventions and comments for these files
* Sort out the SCSS library - utilise the mixins that compass and bootstrap provide

## Local Storage
* Set up so an example that can use local JS storage

## User Accounts
* Create the ability to persist user login and data.

## Navigation
* Create a header above the navigation where stuff can go
    * so nav bar not fixed - or at least fixed under this
* Sort out Drop-downs within Drop-downs - cascading menus
* Sort out I18n Paths for the navigation
* If the language is the mount at root language then we don't need it in the path

We will be utilising Middleman App for the front-end development.
It automatically processes the HTML with some of the elements below.

## Vendor

Lists the third party tools we are using in the development

### jQuery Extensions

List and link any extensions used in the development

## Responsive Design

[Responsive Design](http://en.wikipedia.org/wiki/Responsive_web_design)
[Responsive Design](http://mashable.com/2012/12/11/responsive-web-design/)

## Assets

* Smush and optimise assets - choose correct file format
    * ImageOptim - MAC only program
* Use CDN to server Assets including CSS and JS
    * Amazon Cloudfront
    * Akamai
    * Rackspace files
    * Need to check out per file expiration ability of each CDN

## CSS

[Sass vs Less](http://css-tricks.com/sass-vs-less/)
[Bootstrap Extend](http://twitter.github.com/bootstrap/extend.html)

* Coding Standards - find defacto source
* Minification
* Utilise LESS as Bootstrap does - or SASS if choose a different one.
    * Less Watcher has built in YUI compression
    * SASS has compass
        * Choose Tool - Mac CodeKit
* Formalise version of CSS we are using
* Create Specific IE6 + 7 CSS Stylesheets etc
* Use Bootstrap or some other Grid Framework - use it.
    * Use common CDN to serve this
    * Includes Normalise
    * Use Responsive Media Queries correctly - add meta tags to support

## HTML5

* Coding Standards
* Minification - YUI
* Use CDN
* Correct Doctype
* HTML5 Shim

## JavaScript

* Coding Standards
* Minification
* Use CDN
* JQuery Only
    * Use Google AJAX Libraries to serve this
* Unit Tests
* Utilise JavaScript Templates - dot / plates etc

## Validation of Code

* [W3C HTML Validation](http://validator.w3.org/)
* [W3C CSS Validation](http://jigsaw.w3.org/css-validator/)

## ReCaptcha

* Display form via Frontend JS
* Jquery makes a AJAX post to our recaptcha action
* Recaptcha action makes a post to the recaptcha service
* returns true or false to the service jquery
* False will display a tool tip and reload
* true will allow the user to continue
* Error with other parts of the form will need a reload too

## Todo
* Complete sections
* http://css-tricks.com/three-line-menu-navicon/
* http://www.w3.org/TR/css3-transitions/
* http://caniuse.com/flexbox
* http://html5pattern.com/
* http://mobiscroll.com/
* http://www.html5rocks.com/en/features/performance

[Off Canvas]:http://jasonweaver.name/lab/offcanvas/variations/