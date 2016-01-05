---

heading :
    small : "Alerting"
    title : "Alerting"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Alerting"
    type   : ""

date     : 2014-01-20
excerpt  : "Alerting"
modified : 2014-02-09
tags     : [ alerting ]

---

## Table of Contents
* Table of Contents
{:toc}

## Introduction
[Bower][] is a package manager for front-end development. It simplifies the update
process for libraries such as JQuery and Bootstrap.

Especially useful for concatenating these files together locally through Middleman.

A bower.json file shoudl exist in root which implies the libraries required for the
project. Running the following in the terminal will update and prune these:

    $ /Volumes/Groups/UX/tms.com/www
    $ bower install && bower prune

For a list of available packages please visit [Bower Components][]
Also see [Bower Github][] for the latest development news.

## Install
    $ npm install -g bower

## Tutorials
* [Meet Bower][]

## Packages
[Backbone][]
[Bootstrap SASS][]
[Font Awesome][]
[HolderJS][]
[Jasmine][]
[jQuery][]
[Underscore][]
[ZeptoJS][]

## Todo

* Give more of a breakdown on the bower commands
* Look at YeoMan as a replacement for Thor and Bower perhaps can this be
  intergrated into Middleman or does it compete?

[Bower]:http://bower.io/
[Bower Github]:https://github.com/bower/bower
[Bower Components]:http://sindresorhus.com/bower-components/
[Meet Bower]:http://net.tutsplus.com/tutorials/tools-and-tips/meet-bower-a-package-manager-for-the-web/
[Backbone]:https://github.com/jashkenas/backbone
[Bootstrap SASS]:https://github.com/thomas-mcdonald/bootstrap-sass
[Font Awesome]:https://github.com/FortAwesome/Font-Awesome
[HolderJS]:https://github.com/imsky/holder
[Jasmine]:https://github.com/pivotal/jasmine
[jQuery]:https://github.com/jquery/jquery
[Underscore]:https://github.com/jashkenas/underscore
[ZeptoJS]:https://github.com/madrobby/zepto