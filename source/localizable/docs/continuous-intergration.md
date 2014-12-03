---

author         : Ian Warner
title          : Continuous Intergration
small          : Continuous Intergration
date           : 2001-03-31
tags           : [ continuous intergration ]
og:title       : Continuous Intergration
og:description : Continuous Intergration
og:type        : Continuous Intergration
og:url         :
og:image       :

---

## Table of Contents

* Table of Contents
{:toc}

## Introduction

As part of the Agile process we will utilise [CI][] as much as possible.

Creating BDD unit tests through [Jasmine][] and automating these is vital for a
smooth running of the development cycle.

We can also utilise this for building and deploying the apps to the various test
devices.

## Software

* [Jenkins][] is the industry standards in terms of self hosted CI software. Although
there are now other competitors to this.
* [Team City][] Offer a more premium CI studio for modern development practices.
* [Ansible Works][]

Either of these are compatible with Mac OSX Server

## Thor
Within each project is a [Thor][] script. This provides a means to conduct local
CI and should be updated in regards to what happend on the [Jenkins][] Instance.

Please read the [Thor][] wiki page for more information

## Todo
* Setup a [Jenkins][] instance on the server to lint, build and test the app and site.
* Check out Ansible Works more
* Check out Team City more

[CI]:http://martinfowler.com/articles/continuousIntegration.html
[Jasmine]:http://pivotal.github.io/jasmine/
[Thor]:http://whatisthor.com/
[Jenkins]:http://jenkins-ci.org/
[Team City]:http://www.jetbrains.com/teamcity

[Ansible Works]:http://www.ansibleworks.com/ansibleworks-awx/

* [Best Practices](https://wiki.jenkins-ci.org/display/JENKINS/Jenkins+Best+Practices)
* [Continuous Integration In PHP](http://erichogue.ca/2011/05/php/continuous-integration-in-php/)
* [PHP](http://jenkins-php.org/)
* [Stack Overflow](http://stackoverflow.com/questions/tagged/php+jenkins)

Develop Branch
Some would call this the “integration branch”. This is where any automatic nightly builds are built from.

## CI Server

* Version         :
* Domain          : [Jenkins](http://ci.alphafounders.com)
* SSH Config name : aftools

## Installation

On Debian based machines it is best to install through apt-get

Add the Key

    wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -

Then add the following entry into sources

    sudo nano /etc/apt/sources.list
    deb http://pkg.jenkins-ci.org/debian binary/

Update local package index, then finally install Jenkins

    sudo apt-get update
    sudo apt-get install jenkins
    sudo apt-get install ant
    sudo apt-get install git

## Create Job

    sudo su - jenkins

Basically a Job should pull from the SCM, Process and then Copy to the destination server

Exclude certain folders and files from being pushed to the server

* README.md
* .gitattributes
* .gitgnore

## Features

[PHP CodeSniffer](http://pear.php.net/manual/en/package.php.php-codesniffer.intro.php)
PHP_CodeSniffer is a PHP5 script that tokenises and "sniffs" PHP, JavaScript and CSS files to detect violations of a defined coding standard.
It is an essential development tool that ensures your code remains clean and consistent. It can also help prevent some common semantic errors made by developers.

[PHP Unit](https://github.com/sebastianbergmann/phpunit/)
PHPUnit is the de-facto standard for unit testing in PHP projects. It provides both a framework that makes the writing of tests easy as well as the functionality to easily run the tests and analyse their results.

[PHP Depend](http://pdepend.org/) - Performs static code analysis on a given source base.

[PHP Mess Detector](http://phpmd.org/) - PHPMD can be seen as an user friendly and easy to configure frontend for the raw metrics measured by PHP Depend.

[PHP Copy Paste Detect](https://github.com/sebastianbergmann/phpcpd) - PHPCPD is a Copy/Paste Detector (CPD) for PHP code.

[PHP LOC](https://github.com/sebastianbergmann/phploc) - PHPLOC is a tool for quickly measuring the size and analyzing the structure of a PHP project.

[Doxygen](http://www.stack.nl/~dimitri/doxygen/) - Doxygen is a documentation system for C++, C, Java, Objective-C, Python, IDL (Corba and Microsoft flavors), Fortran, VHDL, PHP, C#, and to some extent D.

## Configuration

* Add System Message "Welcome to  our Continuous Intergration Server"
* Enable Security
    * Security Realm : Jenkins's own user database
        * Make sure Allows Users to Sign Up is checked
    * Authorisation  : Matrix Based security
        * Create initial User Name i.e. iwarner - Give all options
    * Prevent Cross Site Request
        * Check All Crumb options
    * Save - you will be logged out
* Create Account
    * This should be the same as the username in the Authorisation step
    * Un check the Allows Users to Sign UP - save
    * Additional user will need to be added to the Matrix
* Disable Plugins
    * May need to take of crumb control for this
    * Subversion plugin
    * CVS plugin
    * Translation
    * LDAP
    * Maven
    * JavaDoc
* Install Plugins
    * GIT
* Add JDK
    * Un-check Install Automatically
    * Name      : java-1.7.0-openjdk-amd64
    * JAVA_HOME : /usr/lib/jvm/java-1.7.0-openjdk-amd64
* SSH Key
    * To copy to another Amazon instance add the id_rsa.pub key to the Authorised Keys file on the remote machine
* Rsync Connection to staging / production server
    * rsync -e 'ssh -p 2222' -Cavz /var/lib/jenkins/jobs/AlphaFounders\ -\ Vagrant/workspace/ ubuntu@ec2-54-251-72-231.ap-southeast-1.compute.amazonaws.com:/data/www/alphafounders.com/
    * Options
        * -e - Specify SSH on port 2222
        * -C - auto-ignore files the same way CVS does
        * -a - archive mode; same as -rlptgoD (no -H)
            * recurse into directories
            * copy symlinks as symlinks
            * preserve permissions
            * preserve times
            * preserve group
            * preserve owner (super-user only)
            * same as --devices --specials
        * -v - increase verbosity
        * -z - compress file data during the transfer

## ANT

For all jobs we will use ANT

* [Ant Best Practices](http://onjava.com/onjava/2003/12/17/ant_bestpractices.html)