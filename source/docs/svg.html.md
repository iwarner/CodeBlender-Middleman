---

category : "user-experience"
date     : 2016-02-25
excerpt  : "SVG"
modified : 2016-02-25
tags     : [ svg, accessibility ]
title    : "SVG"

---

* Table of contents
{:toc}

## Introduction

- https://github.com/blog/category/engineering

## SVG Go

[SVG Go](https://github.com/svg/svgo) is a node based utility for optimizing SVG
graphic files.

### Install

    $ npm install -g svgo

### Usage

CD into the location of the SVG graphic and run the default command to clean up
the syntax.

    $ svgo test.svg test.min.svg

It is also possible to create the SVG for use in data elements with the following
command.

    $ svgo logo.svg --datauri=base64
