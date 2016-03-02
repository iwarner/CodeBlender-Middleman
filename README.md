# Project : CodeBlender

## Middleman : http://middlemanapp.com/

Start

    $ /var/www/codeblender.net/www
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