---

heading :
    small : "Middleman"
    title : "Middleman"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Middleman"
    type   : ""

category : "front-end"
date     : 2014-01-20
excerpt  : "Middleman"
modified : 2014-02-09
tags     : [ middleman ]

---

## Table of Content
* Table of Contents
{:toc}

## Introduction
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

## Partials
Check out overriding partial helpers
https://gist.github.com/vernonk/4969096

Partials form the building blocks for each project, in a manner of speaking
these can be classified as our Widgets.

For example, creating a new widget would require creating the following files:

* In partial/_library-partials create the named widget file in the correct
  folder or create a new folder.
* In assets/javascripts/_library-js a correspondingly named file should be created
* In assets/stylesheets/_library-scss a correspondingly named files should be created
* All partials should use the il8n variables
* Jumbotron
    * Is in a Header section is this right?
    * Sort out the small Text CSS / Padding too large
* Sidebar
    * Sort out what gets pushed into this section
    * Sort out the affix issues here - { data: { spy: "affix", :"offset-top" => "10", :"offset-bottom" => "250" } }
        * This requires additional styling to be implemented for each state
* Login
    * Add the ability to login via other Open IDs such as Facebook / Google
* Complete the Media List partial
* NavBar should be able to work from an array pushed in via the calling file also
    * Need to sort out icon / logo and text brand to work in tandem - array them
* Nav partials should be merged together there are lots of options for these
    * Basically requires an array and options for classes
* Like Box
    * Complete the different types
    * Expand type check to make sure it is one of the ones allowed
* Like Button
    * Take the HREF from the config by default append the path or use the canonical in the front matter
    * Complete the different code types
* Adsense
    * Need to work on the defaults
* Analytics
    * Need to distinguish the code blocks Google can give the user
* Plus
    * Pass in the Lang to this

## Helpers / Extensions

* Create a helper that gets the page title in a better way - either form frontmatter that could be a translation symbol.
* Database JavaScript needs to be re-factored to remove queries from it
* JavaScript Recaptcha service integration
* Link Helper that takes into account the locale path
* Article Iteration
    * Need to return an array of articles based on inputs
        * Language, Category, Subcategory, Tags
* Portfolio Iteration
    * Helper Method to get all articles within the portfolio category
    * Need to check that subcategory exists when there is a category or it fails
* Create helper methods such as exists and is array
* GitHub helper to get the repositories for a given user or organisation

## Pages
* Sort out the 404.html
    * Need to remove Facebook and other external calls
    * http://bootsnipp.com/snipps/sample-404-page
* Sort out the syntax highlighting
    * Issue with line number alignment
* Need to create a system to check that the front matter is correct in some pages / folders i.e. blog pages
    * Alert if some elements are missing - should be an extension really
* Create the page front matter docs for normal, blog, portfolio and contact pages
    * This could mean there is specific config settings in the config.rb require too like for navigation
* Sort out Heading Tags and placement of these
    * HTML5 Sections allow for multiples - use these

## Todo
* Complete the section
* https://github.com/cavneb/middleman-backbone/tree/master/source/javascripts
* http://www.padrinorb.com/api/Padrino/Helpers/RenderHelpers.html

[Middleman]:http://middlemanapp.com/