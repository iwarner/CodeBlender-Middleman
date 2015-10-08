# Project : CodeBlender

# Middleman : http://middlemanapp.com/

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

# Firebase : https://www.firebase.com

# GitHub : http://github.com

    Test DNS
    $ dig codeblender.net | grep -E '(207.97.227.245|204.232.175.78|199.27.73.133)' || echo "OK"

# BitBucket : http://bitbucket.com

    Add Origin
    $ /var/www/codeblender.net/www
    $ git remote add origin git@bitbucket.org:TriangleSolutions/codeblender.net.git
    $ git push -u origin --all
    $ git push -u origin --tags

    Add Origin
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
