---

heading :
    small : "RBenv"
    title : "RBenv"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "RBenv"
    type   : ""

category : "developer"
date     : 2014-01-20
excerpt  : "RBenv"
modified : 2014-02-09
tags     : [ rbenv ]

---

## Table of Contents

* Table of Contents
{:toc}

## Introduction

[RBENV][] allows the user to select a particular version of Ruby to use on their
development machine. This app was built with Ruby v1.9.3p448. To install run this:

    $ brew install rbenv rbenv-gem-rehash ruby-build

Add the init to the profile script with the followin command

    $ echo 'eval "$(rbenv init - --no-rehash)"' >> ~/.bash_profile

Install the desired Ruby version, make global and run a rehash

    $ rbenv install 1.9.3p448
    $ rbenv global 1.9.3p448
    $ rbenv rehash

Restarting the terminal and running

    $ ruby -v

Should show that you are indeed running the version we just installed.

## Todo

* Look at moving to Ruby version 2.x.x
* What is mavericks default ruby now? Still better to use RBENV probably.