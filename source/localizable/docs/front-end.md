---
author         : Ian Warner
title          : Front end tools and philosophy
small          : Design
date           : 2001-03-31
tags           : [ design, front-end ]
og:title       : Design
og:description : Design
og:type        : Design
og:url         :
og:image       :
---

## Table of Contents

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

## Todo

* Complete sections
* http://css-tricks.com/three-line-menu-navicon/
* http://www.w3.org/TR/css3-transitions/
* http://caniuse.com/flexbox
* http://html5pattern.com/
* http://mobiscroll.com/
* http://www.html5rocks.com/en/features/performance

[Off Canvas]:http://jasonweaver.name/lab/offcanvas/variations/