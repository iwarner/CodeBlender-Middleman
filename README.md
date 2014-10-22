# Project

## Middleman

    $ ~/Google\ Drive/www/codeblender.net/www
    $ bundle exec middleman server -p 8080
    $ sudo bundle exec middleman server -p 80

### Sitemap

    http://localhost:8888/__middleman/sitemap/
    http://localhost:8888/__middleman/config/

### Kill Middleman

    $ ps aux | grep middleman
    $ sudo kill -9

## Bower

    $ bower update && bower prune
    $ bower install jquery#2 --save

## Google Icon

    $ find ~/Google\ Drive/ -name Icon? -exec rm -f {} \;