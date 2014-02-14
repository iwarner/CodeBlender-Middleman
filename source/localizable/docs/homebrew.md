---
author         : Ian Warner
title          : Homebrew
small          : Homebrew
date           : 2001-03-31
tags           : [ homebrew, package ]
og:title       : Homebrew
og:description : Homebrew
og:type        : Homebrew
og:url         :
og:image       :
---

## Table of Contents

* Table of Contents
{:toc}

## Introduction

Ustilising [Homebrew][] will speed up the setup process for the requirements
to run Middleman. Please Read the [docs][].

Homebrew has one dependancy; Command Line Tools for Xcode or [Xcode][] itself.
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

## Todo

* Instructions on Brew Doctor and how to clean up.