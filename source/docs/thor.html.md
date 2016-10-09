---

heading :
    title : "Thor"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Thor"
    type   : ""

category : "front-end"
date     : 2014-01-20
excerpt  : "Thor"
modified : 2014-02-09
tags     : [ thor, ruby ]
title    : "Thor"

---

* Table of Contents
{:toc}

## Introduction

[Thor][] is toolkit for building command-line interfaces.

## Install

~~~shell
$ gem install thor
~~~

## Sample Thor script
This script is shorthand for building middleman and deploying it through
middlman deploy to GitHub.

~~~ruby
desc "build", "build"
def build

    system("clear")

    say("\n\t Middleman Build Clean\n\t")
    system("bundle exec middleman build --clean")

    say("\n\t Middleman Deploy\n\t")
    system("bundle exec middleman deploy")

    say("\n")

end
~~~

## Project Thor

* Create global thor file to create the project template
* Expand the post creation tool - should be global too
    * Allow for the post injection to come from a template
    * Check to see if the directory has already been created too
* Need to also deploy the main source somewhere too as well as gh-pages
* Create a script to produce the correct project template structure

## Todo

* Complete the sections in these instructions
* Add more sample scripts on how we use Thor as a task runner

[Thor]:http://whatisthor.com/