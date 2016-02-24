---

heading :
    small : "Managing ruby and gems"
    title : "RBenv"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "RBenv"
    type   : ""

category : "developer"
date     : 2014-03-16
excerpt  : "RBenv"
modified : 2016-02-23
tags     : [ rbenv ]

---

* Table of Contents
{:toc}

## Introduction

[RBENV][] allows the user to select a particular version of Ruby to use on their
development machine. To install run this:

    $ brew install rbenv ruby-build

Add the init to the profile script with the following command

    $ echo 'eval "$(rbenv init - --no-rehash)"' >> ~/.zshrc

## Install

To see what RBENV versions are available run :

    $ rbenv install --list

Install the desired Ruby version, make global and run a rehash.

    $ rbenv install 2.3.0
    $ rbenv local 2.3.0
    $ rbenv global 2.3.0
    $ rbenv rehash

To reset it back to the system use :

    $ rbenv global system

Restarting the terminal and running

    $ ruby -v

Should show that you are indeed running the version that was just installed.

## Gems

Finding out where the gems are installed is as simple as running a which on a Gem
that you know is installed

    $ gem list
    $ gem which middleman

     ~/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/middleman-4.1.1/lib/middleman.rb

Core folder, based on the version installed :

    $ cd ~/.rbenv/versions/2.3.0/

## Uninstall

To remove RBENV, remove the folder and the brew module

    $ rm -rf ~/.rbenv
    $ brew uninstall rbenv

Also delete all entries from your system configuration files

    $ grep rbenv ~/.bashrc ~/.bash_profile ~/.zshrc /etc/profile /etc/profile.d/*

- https://robots.thoughtbot.com/using-rbenv-to-manage-rubies-and-gems
- https://github.com/ianheggie/rbenv-binstubs