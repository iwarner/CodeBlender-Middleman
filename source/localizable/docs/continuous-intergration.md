---
author         : Ian Warner
title          : Continuous Intergration
small          : Continuous Intergration
date           : 2001-03-31
tags           : [ continuous intergration ]
og:title       : Continuous Intergration
og:description : Continuous Intergration
og:type        : Continuous Intergration
og:url         :
og:image       :
---

## Table of Contents

* Table of Contents
{:toc}

## Introduction

As part of the Agile process we will utilise [CI][] as much as possible.

Creating BDD unit tests through [Jasmine][] and automating these is vital for a
smooth running of the development cycle.

We can also utilise this for building and deploying the apps to the various test
devices.

## Software

* [Jenkins][] is the industry standards in terms of self hosted CI software. Although
there are now other competitors to this.
* [Team City][] Offer a more premium CI studio for modern development practices.
* [Ansible Works][]

Either of these are compatible with Mac OSX Server

## Thor

Within each project is a [Thor][] script. This provides a means to conduct local
CI and should be updated in regards to what happend on the [Jenkins][] Instance.

Please read the [Thor][] wiki page for more information

## Todo

* Setup a [Jenkins][] instance on the server to lint, build and test the app and site.
* Check out Ansible Works more
* Check out Team City more

[CI]:http://martinfowler.com/articles/continuousIntegration.html
[Jasmine]:http://pivotal.github.io/jasmine/
[Thor]:http://whatisthor.com/
[Jenkins]:http://jenkins-ci.org/
[Team City]:http://www.jetbrains.com/teamcity
[Ansible Works]:http://www.ansibleworks.com/ansibleworks-awx/