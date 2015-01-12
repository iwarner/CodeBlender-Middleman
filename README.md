# Project : CodeBlender

## Middleman : http://middlemanapp.com/

    $ /var/www/codeblender.net/www
    $ bundle exec middleman server

### Sitemap

    http://localhost:4567/__middleman

### Kill

    $ ps aux | grep middleman
    $ sudo kill -9

## Git

Managing remotes

    $ git remote -v
    $ git remote add bitbucket git@bitbucket.org:DryKISS/codeblender.net.git

## BitBucket

    git@bitbucket.org:TriangleSolutions/codeblender.net.git

    $ ~/Dropbox/www/DryKiss/codeblender.net/www/source
    $ git remote add origin git@bitbucket.org:TriangleSolutions/codeblender.net.git
    $ git push -u origin --all
    $ git push -u origin --tags

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

## Thor : http://whatisthor.com/

Used for processing some common tasks

# CODEBASE
# HAML          - http://haml.info/
# CoffeeScript  - http://coffeescript.org/
# SCSS          - http://sass-lang.com/
# Middleman App - http://middlemanapp.com/
# Bower         - http://bower.io/
# Thor          - http://whatisthor.com/