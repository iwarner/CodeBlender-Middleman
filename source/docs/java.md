---

heading :
    title : "JAVA"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "JAVA"
    type   : ""

category : "development"
date     : 2014-01-20
excerpt  : "JAVA"
modified : 2014-02-09
tags     : [ java ]
title    : "JAVA"

---

* Table of contents
{:toc}

## Introduction

down vote
Don't rely on Oracle to install Java properly on your mac.

Use HomeBrew.

brew tap caskroom/cask
brew install brew-cask
If you get the error "already installed", follow the instructions to unlink it, then install again:

brew unlink brew-cask
brew install brew-cask
And then finally:

brew cask install java
If you want to manage multiple versions of Java on your mac, consider using jenv.

http://stackoverflow.com/questions/24342886/how-to-install-java-8-on-mac