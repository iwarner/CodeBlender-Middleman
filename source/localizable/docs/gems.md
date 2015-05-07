---

heading :
    small : "Alerting"
    title : "Alerting"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Alerting"
    type   : ""

date     : 2014-01-20
excerpt  : "Alerting"
modified : 2014-02-09
tags     : [ alerting ]

---

## Table of Contents

* Table of Contents
{:toc}

## Introduction

Ruby gems are intergral to running Middleman. There is an easy solution though
at it involves utilising the Bundler gem package manager

    $ gem install --no-ri --no-rdo bundler

This will allow us to run the install command within our Middleman folder later,
that will then install all the necessary Gems.

## Install

So now we need to make sure all the Gems are up to date. Run the following commands,
making sure you are in the public folder of the project.

    $ cd ~/Dropbox/www/x
    $ rm gemfile.lock
    $ bundle install

## Todo

* Instructions on installing bundler and what is it
* Instructions on Thor installaiton or link to File