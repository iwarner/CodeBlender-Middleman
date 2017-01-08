---

<<<<<<< HEAD
heading :
    small : "Blog"
    title : "Blog"

meta :
    title  : "Blog - CodeBlender"

=======
>>>>>>> updates
category : "user-experience"
date     : 2014-01-20
excerpt  : "Blog"
modified : 2014-02-09
tags     : [ blog ]
title    : "Blog"

---

* Table of Contents
{:toc}

## Introduction

## Articles

## Table of Contents
The ToC is an automatic [Kramdown utility][], simply including the following
within a markdown document will create an indexed contents element.

~~~markdown
* ToC
{:toc}
~~~~

## Tag Cloud
A Tag Cloud helper and extension has been created to automatically create the cloud
with the following command

~~~ruby
-# Tag Cloud
= codeBlender "tag-cloud", "molecule"
~~~

## Footer

## Related Posts
[Kramdown utility]:http://kramdown.gettalong.org/converter/html.html#toc
