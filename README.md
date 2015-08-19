# Project : CodeBlender

Amazon.co.uk,
Customer Services,
60 Holborn Viaduct
London
EC1A 2FD
United Kingdom

# Middleman : http://middlemanapp.com/

    $ /var/www/codeblender.net/www
    $ bundle exec middleman server

    Variables
    http://localhost:4567/__middleman

    Kill
    $ ps aux | grep middleman
    $ sudo kill -9

    $ middleman init -T tdreyno/my-middleman-starter ~/Sites/new-site

# Firebase : https://www.firebase.com

    Test User
    User : ian.warner@drykiss.com
    Pass : dkTestUser15

# GitHub : http://github.com

    $ dig tml.footyjapan.com   | grep -E '(207.97.227.245|204.232.175.78|199.27.73.133)' || echo "OK"
    $ dig dontpoisonmyskin.com | grep -E '(207.97.227.245|204.232.175.78|199.27.73.133)' || echo "OK"

# BitBucket : http://bitbucket.com

    git@bitbucket.org:TriangleSolutions/codeblender.net.git

    $ /var/www/codeblender.net/www
    $ git remote add origin git@bitbucket.org:TriangleSolutions/codeblender.net.git
    $ git push -u origin --all
    $ git push -u origin --tags

# Managing remotes

    $ git remote -v
    $ git remote add bitbucket git@bitbucket.org:DryKISS/codeblender.net.git

# Bundler : http://bundler.io/

    This must be installed, it manages the projects required Gems.

    $ gem install bundler
    $ bundle install

# Bower : http://bower.io/

    This must be installed, it manages the projects front end dependencies. To install
    this Node must be installed : http://nodejs.org/ use the binary.

    $ npm install -g bower

    Initially you will want to install the bower components

    $ bower install

    Updating can be dangerous and it may update packages that could break features

    $ bower update
    $ bower prune

# Thor : http://whatisthor.com/

# File System

    $ find . -name .svn -exec echo {} \;
    $ find . -name .svn -exec rm -rf {} \;

    $ find . -name .git -exec echo {} \;
    $ find . -name .git -exec rm -rf {} \;

    $ find . -name Thumbs.db -exec echo {} \;
    $ find . -name Thumbs.db -exec rm -rf {} \;

# HAML : http://haml.info/

# CoffeeScript : http://coffeescript.org/

# SCSS : http://sass-lang.com/
