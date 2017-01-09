---

category : "developer"
date     : 2014-01-20
excerpt  : "Homebrew"
modified : 2014-02-09
tags     : [ homebrew ]
title    : "Homebrew"

---

* Table of Contents
{:toc}

## Introduction

Utilising [Homebrew][] will speed up the set-up process for the requirements
to run Middleman. Please Read the [docs][].

Homebrew has one dependency; Command Line Tools for Xcode or [Xcode][] itself.
Xcode can be installed through the App Store; then add the command line tools
within Xcode with the following steps

1. Open the Xcode preferences and select the downloads tab.
2. Select command line tools to install.

Install Homebrew this with the following command.

    $ ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

It may warn you about changing the ownership of the Homebrew folder. Otherwise
this command should do the trick.

    $ sudo chown -R `whoami` /usr/local
    $ brew doctor

Running the doctor command will state whether the system is working correctly. If
there are issues please restart the terminal shell and try again. Otherwise
follow any prompts it spits out.

The last step is to update the sytem path variable. Running the following command
will add the necessary line to this variable.

    $ echo 'export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"' >> ~/.bash_profile

Restart the terminal after this step.

Running

    $ brew update && brew upgrade

Will update the system

## Issues

If there are issues with formula you can browse to Homebrew's installation folder
and do a git pull to get the latest files, then update and upgrade.

    $ cd /usr/local
    $ git pull origin master

## Todo

* Instructions on Brew Doctor and how to clean up.

* Document i.e. when update OSX and links disappear brew list -1 | while read line; do brew unlink $line; brew link $line; done

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

[Xcode]:http://railsapps.github.io/xcode-command-line-tools.html
