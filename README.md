# Project : CodeBlender

## ENOM Domains

01. classicpcgames.com
02. codeblender.io
03. codeblender.net
04. customuniformwarehouse.com
05. dontpoisonmyskin.com
06. drykiss.com
07. forkeyring.com
08. growherbs.io
09. ianwarner.com
10. matchtheworld.com
11. onlyasmile.com
12. phpcodingstandards.com
13. phpmultiplenewsletters.com
14. phpsupporttickets.com

## Easily Domains

01. classicxbox360games.com
02. phptasks.com
03. phpfinances.com
04. classicpspgames.com
05. triangle-solutions.com
06. phpsupporttickets.com
07. phpmultiplenewsletters.com

## Links

- https://rossta.net/blog/using-webpack-with-middleman.html
- https://lifemobile.co.uk/
- https://www.giffgaff.com/
- http://www.idmobile.co.uk/
- http://mailtrain.org/
- http://webkay.robinlinus.com/
- http://stackoverflow.com/questions/2304863/how-to-write-a-good-readme
- https://github.com/groteck/middleman-docker

## Middleman : http://middlemanapp.com/

Start

    $ /var/www/CodeBlender
    $ bundle exec middleman server

Variables

    http://localhost:4567/__middleman

Kill

    $ ps aux | grep middleman
    $ sudo kill -9

Template install

    $ middleman init -T tdreyno/my-middleman-starter ~/Sites/new-site

## Firebase : https://www.firebase.com

## BitBucket : http://bitbucket.com - Used for private source code

Repositories

    $ curl --user DryKISS:Password https://api.bitbucket.org/1.0/user/repositories

Create Repository

    $ curl -X POST -v -u DryKISS:Password -H "Content-Type: application/json" \ https://api.bitbucket.org/2.0/repositories/DryKISS/codeblender.net \ -d '{"scm": "git", "is_private": "true", "fork_policy": "no_public_forks" }'

Initialise

    $ git init

Add Origin

    $ git remote add origin git@bitbucket.org:TriangleSolutions/codeblender.net.git
    $ git push -u origin --all
    $ git push -u origin --tags

Add Remote

    $ git remote -v
    $ git remote add bitbucket git@bitbucket.org:DryKISS/codeblender.net.git
    $ git push -u origin --all # pushes up the repo and its refs for the first time
    $ git push -u origin --tags # pushes up any tags

## GitHub : http://github.com - Used for page hosting

Test DNS

    $ dig codeblender.net | grep -E '(207.97.227.245|204.232.175.78|199.27.73.133)' || echo "OK"

Create Repository

    @todo - use API to create the repository - https://developer.github.com/v3/

## Bundler : http://bundler.io/

This must be installed, it manages the projects required Gems.

    $ gem install bundler
    $ bundle install

## Bower : http://bower.io/

This must be installed, it manages the projects front end dependencies. To install
this Node must be installed : http://nodejs.org/ use the binary.

    $ npm install -g bower

Initially you will want to install the bower components

    $ bower install

Updating can be dangerous and it may update packages that could break features

    $ bower update
    $ bower prune

## Gulp

During the build cycle we run UnCSS to strip out unwanted CSS, this requires
gulp and related packages to be installed.

Install Gulp globally

    $ npm install -g gulp

Run the local package.json file to get local node_modules

    $ npm install

Command that will be run

    $ gulp uncss

## Thor : http://whatisthor.com/

## File System

Delete SVN directories

    $ find . -name .svn -exec echo {} \;
    $ find . -name .svn -exec rm -rf {} \;

Delete GIT directories

    $ find . -name .git -exec echo {} \;
    $ find . -name .git -exec rm -rf {} \;

Delete Windows Thumbs

    $ find . -name Thumbs.db -exec echo {} \;
    $ find . -name Thumbs.db -exec rm -rf {} \;

Google Icon

    $ find ~/Google\ Drive/ -name Icon? -exec rm -f {} \;

## Installation requirements

@see http://brettklamer.com/diversions/non-statistical/install-middleman-on-windows/
@see http://jekyll-windows.juthilo.com/1-ruby-and-devkit/

All the following likely need to installed as Administrator unless your account has
access to modify PATH related entities

- ! Run as administrator

- GIT - should already have - will give you GIT cmd and GIT bash
    - Required for bower and bundle
    - Download : http://git-for-windows.github.io/

- Ruby
    - Install RubyInstaller and RubyInstaller-Devkit
    - Download both here : http://rubyinstaller.org/downloads/ - use 2.3.0 32bit
    - Double click to install Ruby
        - ! Check add Ruby to Path in the installation process
    - For DevKit - extract to C:\RubyDevKit\
        - cd to this
        - ruby dk.rb init
        - ruby dk.rb install
    - Gems
        - Bundler and Thor
            - $ gem install --no-ri --no-rdoc -v 1.9 bundler
            - $ gem install --no-ri --no-rdoc thor

- Node
    - Use 4.x
    - Required for bower : https://nodejs.org/en/
    - Tutorial : http://blog.teamtreehouse.com/install-node-js-npm-windows
    - Run
        - $ npm install -g bower
        - https://github.com/bower/bower

- Middleman
    - https://middlemanapp.com/basics/install/
    - $ bower install  - This downloads the front end dependencies like Bootstrap / Angular
    - $ bundle install - in the project root to run the GemFile and install required Gems
        - If issue with nokogiri then - gem install nokogiri -v '1.6.8.rc3'
    - Test in new directory the following :
    - $ middleman init
    - $ bundle exec middleman server
    - $ bundle exec middleman build