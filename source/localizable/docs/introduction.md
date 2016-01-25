---

heading :
    small : "Introduction"
    title : "Introduction"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Introduction"
    type   : ""

category : "developer"
date     : 2014-01-20
excerpt  : "Introduction"
modified : 2014-02-09
tags     : [ introduction ]

---

# INTRODUCTION

The following collection of files and processes will aid in the setup of a new
local MAC Development machine.

Please write all documentation in [Markdown style](http://daringfireball.net/projects/markdown/)

Test document at [Dingus](http://daringfireball.net/projects/markdown/dingus)

## PROCESS

Install Command Line Tools for XCode - HomeBrew requires this.

* [CMD Line Tools](https://developer.apple.com/downloads/index.action)

Install Dropbox / Google Drive (Optional)

* [DropBox](http://db.tt/ustBzUf)
* [Google Drive](https://tools.google.com/dlpage/drive)

Install in the default directory

* Run Setup.sh script
* Install [Vagrant](http://vagrantup.com/)
* Install [Virtual Box](https://www.virtualbox.org/wiki/Downloads/)

## HOMEBREW

* [HomeBrew](http://mxcl.github.com/homebrew/)
* [HomeBrew Formulae](https://github.com/mxcl/homebrew/tree/master/Library/Formula)

The following are helpful:

* [GNU Core Utilities](http://www.gnu.org/software/coreutils/)
* [GNU Find Utilities](http://www.gnu.org/software/findutils/)
* [Bash 4](http://www.gnu.org/software/bash/)
* [ZSH](http://www.zsh.org/)
* [GNU Wget](http://www.gnu.org/software/wget/)
* [OSX Dupes](https://github.com/Homebrew/homebrew-dupes)
* [PHP](https://github.com/josegonzalez/homebrew-php)
* [MySQL](https://github.com/mxcl/homebrew)
* [ACK](http://betterthangrep.com/)
* [GIT](http://git-scm.com)
* [Lynx](http://lynx.isc.org/)
* [Rename](http://plasmasturm.org/code/rename)
* [Tree](http://mama.indstate.edu/users/ice/tree/)
* [Webkit 2 PNG](http://www.paulhammond.org/webkit2png/)
* [CDRTools]()
* [Git Flow](https://github.com/nvie/gitflow)

### CAVEATS

#### PHP 5.4

If there are any pre-existing pear install outside of homebrew-php, and you are
using a non-standard pear.conf location, installation may fail.

For 10.5 and Apache:
    Apache needs to run in 32-bit mode. You can either force Apache to start
    in 32-bit mode or you can thin the Apache executable.

To enable PHP in Apache add the following to httpd.conf and restart Apache:
    LoadModule php5_module /usr/local/Cellar/php54/5.4.6/libexec/apache2/libphp5.so

The php.ini file can be found in:
    /usr/local/etc/php/5.4/php.ini

PEAR

If pear complains about permissions, 'Fix' the default PEAR permissions and config:
    chmod -R ug+w /usr/local/Cellar/php54/5.4.6/lib/php
    pear config-set php_ini /usr/local/etc/php/5.4/php.ini

Extensions

If you are having issues with custom extension compiling, ensure that this php is
in your PATH:
    PATH="$(brew --prefix josegonzalez/php/php54)/bin:$PATH"

Extensions will never be compiled against this homebrew-php PHP. Please install them
using --with-homebrew-php to enable compiling against this php.

FPM

If you have installed the formula with --with-fpm, to launch php-fpm on startup:
    * If this is your first install:
        mkdir -p ~/Library/LaunchAgents
        cp /usr/local/Cellar/php54/5.4.6/homebrew-php.josegonzalez.php54.plist ~/Library/LaunchAgents/
        launchctl load -w ~/Library/LaunchAgents/homebrew-php.josegonzalez.php54.plist

    * If this is an upgrade and you already have the homebrew-php.josegonzalez.php54.plist loaded:
        launchctl unload -w ~/Library/LaunchAgents/homebrew-php.josegonzalez.php54.plist
        cp /usr/local/Cellar/php54/5.4.6/homebrew-php.josegonzalez.php54.plist ~/Library/LaunchAgents/
        launchctl load -w ~/Library/LaunchAgents/homebrew-php.josegonzalez.php54.plist

Mountain Lion comes with php-fpm pre-installed, to ensure you are using the brew version you need to make sure /usr/local/sbin is before /usr/sbin in your PATH:

  PATH="/usr/local/sbin:$PATH"

You may also need to edit the plist to use the correct "UserName".

Please note that the plist was called 'org.php-fpm.plist' in old versions of this formula.

#### MySQL

brew info mysql

### REFERENCE

* [GitHub DotFiles](http://dotfiles.github.com/)
* [Mathias DotFiles](https://github.com/mathiasbynens/dotfiles)
* [Dave Lens DotFiles](https://github.com/davelens/dotfiles)
* [Gianni Chiappetta](https://github.com/gf3/dotfiles)
* [Matijs Brinkhuis](https://github.com/matijs/dotfiles)
* [Ben Alman](https://github.com/cowboy/dotfiles)
* [Nicolas Gallagher](https://github.com/necolas/dotfiles)
* [Tom Ryder](https://github.com/tejr/dotfiles)
* [tswicegood](https://github.com/revans/bash-it)

## TODO

* Re-Order the .osx file so that any items that need configuring are at the top
** Or provide an extension file if possible
* Document Setup.sh more - list what it does
* Homebrew Script should install HomeBrew too
* Remove PEAR and PHP from current Mac system
* PEAR Upgrade and Install useful packages such as PHPUnit and XDEBUG
* Create more wiki pages with Documentation for each script
* Install Vagrant through the ruby gems
* Make sure the directories are not hard coded