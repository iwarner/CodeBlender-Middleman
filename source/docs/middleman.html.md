---

category : "front-end"
date     : 2014-01-20
excerpt  : "Middleman"
modified : 2014-02-09
tags     : [ middleman ]
title    : "Middleman"

---

* Table of Contents
{:toc}

## Introduction

[Middleman][] runs from the source folder. However there are a few configuration
files outside of this:

* config.rb - Main Middleman configuration file, should not need to alter this
  much. But this is where we would place any proxy requirements, i.e. Dynamic
  Pages.
* Data folder contains the configuration and data elements for the project.

## Install

In each project there should be a required gemfile. Running:

    $ bundle install

Will run it and install the required gems for the project

## Project Templates

@see http://middlemanapp.com/basics/getting-started/#toc_6

When initialising a new Middleman project you should define the Template that
should be associated with the development.

    $ cd /path-to-project
    $ middleman init Test --template=phonegap

Command Line
-T, [--template=TEMPLATE]

## Running Middleman

Make sure you are in the public folder of the project, then run the command to
initialise Middleman, you need to put in your admin account to run this on Port
80. See ripple docs for instructions on install and setup.

    $ folder.tms
    $ launch.tms
    $ /var/www/project.com && sudo bundle exec middleman server -p 80
    $ ripple emulate --remote http://localhost

To run on another port use, this will default to port :4567

    $ bundle exec middleman server

Open up Chrome and browse to http://localhost or http://localhost:4567

Middleman has some great toys to play with, for instance changes in the main
codebase will conjure up a live reload of the browser screen. Please note this
will not work for Library files; if these require editing then the service must
be restarted.

    $ ctrl + c
    $ sudo bundle exec middleman server -p 80

Writing code in HAML, CoffeeScript and SCSS will be automatically compiled from
the source directory for instant viewing in the development browser.

## Build Middleman

When you are ready to release some code the following command will instruct
Middleman to build the minified and concatenated code.

    $ bundle exec middleman build --clean --verbose

The output will simply be a bunch of HTML files, assets, one CSS file and one
JavaScript file.

## Kill Middleman

    $ ps aux | grep middleman
    $ sudo kill -9 15106

## Partial

Check out overriding partial helpers
https://gist.github.com/vernonk/4969096

Partials form the building blocks for each project, in a manner of speaking
these can be classified as our Widgets.

For example, creating a new widget would require creating the following files:

* In partial/_library-partials create the named widget file in the correct
  folder or create a new folder.
* In assets/javascripts/_library-js a correspondingly named file should be created
* In assets/stylesheets/_library-scss a correspondingly named files should be created

## Wordpress to Middleman

[wp2middleman][] is a gem that can be installed that iterates through an exported
wordpress XML file and produces compatible middleman blog posts.

    https://github.com/jekyll/jekyll-import/blob/v0.10.0/lib/jekyll-import/importers/wordpressdotcom.rb

### Install

    $ gem install wp2middleman

### Run

    $ wp2mm footyjapancompetitions.wordpress.2016-02-10.xml --body_to_markdown true --include_fields wp:post_id link

## Todo

* Complete the section
* https://github.com/cavneb/middleman-backbone/tree/master/source/javascripts
* http://www.padrinorb.com/api/Padrino/Helpers/RenderHelpers.html

[Middleman]:http://middlemanapp.com/
[wp2middleman]:https://github.com/mdb/wp2middleman
