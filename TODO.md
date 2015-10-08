# TODO

## Middleman

* Check out the next version of Middleman v4

## CodeBlender Examples

* This should be used as test pages for Jasmine to test front end elements
* Link Bootstrap documentation into here
* Symlink into each project
* Need relative assets on for the documentation area
* Make CodeBlender Project Like thus:
    http://www.fork-cms.com/extensions/apps

## Config

* Create config.rb file with the default elements only
    * Symlink the config file between projects
* Can we include config elements into this file to extract for instance blog data
    * Perhaps we can then override a global config

## Layouts

* Create a coming soon / maintenance layout

## Partials

* Sort out naming convention of _ or -
* All partials should use the il8n variables
* Jumbotron
    * Is in a Header section is this right?
    * Sort out the small Text CSS / Padding too large
* Sidebar
    * Sort out what gets pushed into this section
    * Sort out the affix issues here - { :data => { :spy => "affix", :"offset-top" => "10", :"offset-bottom" => "250" } }
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
* Favicon - move touch icons out of this partial
* Blog Module
    * Should be definable by Country, Language, Product, Category and Subcategory
    * Include the data etc
    * Enable tabs to be positioned left or right - default left.
* Blog Footer
    * Link Up Date
    * Link up Author
    * Link up Comments

## Helpers / Lib / Extensions

* Create more helpers
    * Can / should some partials be helpers?
* Link Helper that takes into account the locale path
* Article Iteration
    * Need to return an array of articles based on inputs
        * Language
        * Category
        * Subcategory
        * Tags
* Portfolio Iteration
    * Helper Method to get all articles within the portfolio category
    * Need to check that subcategory exists when there is a cateogory or it fails
* Create helper methods such as exists and is array

## SEO, SEM, Adverts

* Add the canonical name to the pages
    * <link rel="canonical" href="http://darrenknewton.com/2012/09/16/hacking-up-sites-with-middleman/">
* Sort out http://schema.org/ micro-formatting over the layouts / partials
* Sort out the HTML5 sections and Headers within
* Create standard Adsense units
* Create a Google Sitemap
    * https://github.com/middleman/middleman/issues/259
    * https://github.com/pixelpark/middleman-sitemap
    * http://www.nicolasgarnil.me/blog/2012/programmatically-creating-a-sitemap-for-your-middleman-website/

## Pages

* Sort out the 404.html
    * Need to remove Facebook and other external calls
* Sort out the syntax highlighting
* Need to create a system to check that the front matter is correct in some pages / folders i.e. blog pages
    * Alert if some elements are missing - should be an extension really
* Create the page front matter docs for normal, blog, portfolio and contact pages
    * This could mean there is specific config settings in the config.rb require too like for navigation
* Sort out Heading Tags and placement of these
    * HTML5 Sections allow for multiples - use these
* Allow for a global decision on whether site is fluid or not
    * Place flag in config.rb

## Localisation

* Language change should change to the equivalent page in the other language
* Update the HTML lang variable in the wrapper layout
* In wrapper need to check that FacebookLocale is actually set in config.

## Social

* Add in Facebook Connect
* Social buttons need the full attributes available to them
* Sort out button positioning when in-line - i.e. Facebook - twitter should line up
* Create a partial that includes loops through a data array of buttons required
* URLs can be derived from canonical URL so make sure this is in place
* Facebook Locales should be handled outside of config.yaml it could get long.
    * Automate this more.

## Navigation

* Create a header above the navigation where stuff can go - so nav bar not fixed
* Sort out Drop-downs within Drop-downs - cascading menus
* Can the title for the drop-down be a link also - only work with hover
* Sort out I18n Paths for the navigation
* If the language is the mount at root language then we don't need it in the path

## User Accounts

* Create the ability to persist user login and data.

## Search

* Create a search engine for the site
    * Create JS search
    * API into on-line elastic search
* Google Search make this a standard widget that can be applied to any site.

## E-Commerce

* Sort out a JS shopping system
    * Such as FB credits, Google Cart or Stripe

## Contact Form

* This should be a global page amongst all sites - symlink?
* Investigate Google Forms - or other providers
* Validation Client Side

## Blog

* Blog frontmatter should have the following
    * Title
    * Date
    * Author
    * Comments and Share links - Facebook / Twitter
    * Excerpt - Read More
    * Categories
    * Tags
    * Image
* Article page should have:
    * Next and previous links
    * Disqus comments
    * Facebook Like Buttons
* Create the correct HTML5 section and microformats i.e. article
* Create a better looking blog home page - list 5 articles / categories etc.
* Create a TOC section in the sidebar
    * Need to traverse the current blog and pull out titles
    * Kramdown has though automatic Table of contents
* Create relevant blog posts to the current one viewed
    * This is being worked on by developers
* Can Blog templates be extracted and symlinked in
* Blog variables should be moved into the main config.yaml
* Tag Cloud - https://github.com/middleman/middleman-blog/issues/101
    * Sort out he layout for the Tag cloud
* Should fork this to add the changes required for the blog categories etc
    * Gemfile change to take our repo instead of original

## Sidebar

* Sort out the Affix - need to work out how to control with data elements or JS

## Footer

* Footer responsive needs fixing for lower resolutions - extra margin
* Define the number of columns in the yaml - need to adjust the span number
    * Or count the entries in the page
* Sort out the copy write messages

## Images

* Sort out a standard template image set - i.e. the white-leather image
    * Standard logo etc.
* Create a standard list of image folders - i.e. logo, template, banners etc.
* Use holder.js for local development only - if build? works in sprockets

## JS Framework

* Decide upon using Backbone or framework such as Angular or custom
* Write a script that checks for the latest versions of the Vendor libraries
* Use Jasmine or some other BDD testing suite for JS
* Can we use Zepto with Bootstrap
* Create a Holder JS Short-cut Helper - default to PNG etc.

## Storage

* Set up so an example that can use local JS storage

## SCSS

* Change the colour scheme easily through variables
    * Use bootstrap less / sass
* Sort out link colours through variables
* Sort out the naming conventions and comments for these files
* Use compass maybe
* Sort out the SCSS library - utilise the mixins that compass and bootstrap provide

## Fonts

* Do something with the fonts folder - do not need all fonts pushed - only font-awesome really.
* Look at integration with Google Fonts

## Feeds

* Create Feedburner accounts - do they have an Api
* Does chrome usually show the feed icon in the bar - research this
* Create the atom.json, rss feed
    * <link href='http://feeds.feedburner.com/DesignByJoel' rel='alternate' type='application/rss+xml' />

## Project Thor

* Make project thor a symlink too - but needs to be manual then run links in thor
* Expand the post creation tool
* Allow for the injection to come from a template
* Check to see if the directory has already been created too
* Complete the open server command
* Need to also deploy the main source somewhere too as well as gh-pages
* Create a script to produce the correct project template structure

## Secure Download

* Once a customer purchases a bit of software how do we assure they get access to it

## Modules

### Portfolio

* This really needs looking at in terms of replicated code

## Cache

* Check out DNS Prefetching
    SPDY - http://en.wikipedia.org/wiki/SPDY