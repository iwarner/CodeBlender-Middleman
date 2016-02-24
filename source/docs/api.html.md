---

heading :
    small : ""
    title : "Api"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Api"
    type   : ""

category : "back-end"
date     : 2014-01-20
excerpt  : "Api"
modified : 2014-02-09
tags     : [ api ]

---

* Table of Contents
{:toc}

## Introduction

The API will be utilised by all future Alpha projects
[SaaS approach](http://en.wikipedia.org/wiki/Software_as_a_service)

Always think is the code fast!

## API Calls
Document the API nodes available. Utilise Flikr API docs as an example

Below is an example of how REST works, and how it can be tested with command line CURL

1. **Create** new $entity      `curl -XPUT $data http://api.alphafounders.com/v($version)/$entity`
2. **Update** existing $entity `curl -XPOST $data http://api.alphafounders.com/v($version)/$entity/$id`
3. **Delete** $entity          `curl -XDELETE http://api.alphafounders.com/v($version)/$entity/$id`
4. **Get lists** $entity       `curl http://api.alphafounders.com/v($version)/$entity/*`
5. **Get detail** $entity      `curl http://api.alphafounders.com/v($version)/$entity/$id`

## Considerations
* Document the API.
* Security audit for devices - do we oAuth etc?
* Start looking and defining a Third Party developer API - [Flikr API](http://www.flickr.com/services/api/)