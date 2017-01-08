---

<<<<<<< HEAD
heading :
    small : "Website i18n"
    title : "Localization"

meta :
    title  : "Localization - CodeBlender"
    type   : "article"

=======
>>>>>>> updates
category : "developer"
date     : 2016-02-05
excerpt  : ""
modified : 2016-02-05
tags     : [ localization, internationalization, i18n ]
title    : "Localization"

---

* Table of Contents
{:toc}

## Introduction

This document will outline the module provided by [Middleman][] for localization,
and CodeBlender's preferred process to work with translation agents.

The general idea is that through convention any edits can be handled more automatically.

## Activation

[Middleman][] provides an extension to facilitate a full GUI [internationalization][].
Simply activate the module in the config.rb script.

~~~ ruby
activate :i18n
~~~

## Creation

CodeBlender follows the default set up for middleman by requiring the locale files
to be within the locales folder at the root level :

    locales/en.yml

The YAML file is simply a key, value store for each string that requires translation.
These keys obviously need to be identical across all locale files with differing values.

~~~ yaml
---
en:
  hello: "Hello"
~~~

~~~ yaml
---
es:
  hello: "Hola"
~~~

There are more advanced options described in the [internationalization][] docs.

## Utilisation

Each [Middleman][] template in the localizable folder will then have access to the
locale strings. In HAML (CodeBlender's template language ) they are created by

~~~ haml
= string :hello
World
~~~

Each language is then accessible in its own name spaced path :

    /en/index.html
    /es/index.html
    /fr/index.html

## Process

Firstly the developer should create a new Google sheet (or excel) that has the following
columns. CodeBlender prefers a cloud based sheet for automation, collaboration and
revision purposes.

Currently we require that the sharing permissions are set to 'Anyone with the link
with can view'.

- KEY (Template identifier)
- English (en) - Language A
- French (fr)  - Language B

An example [sheet][] can be seen here. At CodeBlender we write our keys in English
but this is entirely up to you.

### Rules

The header row is not just there for convenience, but has one very important duty.
Each language locale file is named after the string within the brackets, and should
be representative of the language two or full ISO code.

The keys should be as verbose as possible in describing possible location, utilisation
and context. For example the pagination module requires the following keys.

    pagination.first, First
    pagination.next, Next
    pagination.previous, Previous
    pagination.last, Last

We can now see from the key the module and English pointer. This can be viewed in
[sheet][] also.

We can also comment out an entire Row by adding a hash in the first column. This
allows us to write some instructions or perhaps add a link to a wireframe on InVision.

- An empty row will just be ignored, do not put any text in any of the columns.

### Automation

By providing the sheet key to the developer, we can utilise the CodeBlender
core script to turn the Google sheet into the required locale files.

An example link will look like

    1Z2VSgyUsSoGo6pqNL5ZxQT6SBjKXQEnvPha-EYeH3SQ

[Middleman]:http://middlemanapp.com/
[internationalization]:https://middlemanapp.com/advanced/localization/
[sheet]:https://goo.gl/iTNmM5

- https://localise.biz/plans
