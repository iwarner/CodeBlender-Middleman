---

author         : "Ian Warner"
date           : 2014-01-20
excerpt        : "Social"
modified       : 2014-02-09
tags           : [ social ]
title          : "Social"
small          : "Social"
og:title       : "Social"
og:description : "Social"
og:type        :
og:url         :
og:image       :

---

## Table of Contents
* Table of Contents
{:toc}

## Introduction

### Social
* Add in Facebook Connect
* Social buttons need the full attributes available to them
* Sort out button positioning when in-line - i.e. Facebook - twitter should line up
* Create a partial that includes loops through a data array of buttons required
* URLs can be derived from canonical URL so make sure this is in place
* Facebook Locales should be handled outside of config.yaml it could get long.
    * Automate this more.

## Facebook

### Application

[AlphaFounders](https://www.facebook.com/apps/application.php?id=)
[Apps](https://developers.facebook.com/apps/)

You will need to have a verified user account to be added as an admin

[Verify Account](https://www.facebook.com/help/398085743567023/)

### Page

[AlphaFounders](https://www.facebook.com/alphafounders)

### Reviews / Comments

[Comment Moderation](https://developers.facebook.com/tools/comments?id=)

You will need to be an admin on the application to see this

[Comments Plugin](https://developers.facebook.com/docs/reference/plugins/comments/)

Subscribing to this events 'comment.create' and 'comment.remove' we
add the facebook comment information in our database.

### Configuration

[Optimise Facebook Plugins](http://developers.facebook.com/blog/post/530/)
[PHP SDK](https://github.com/facebook/facebook-php-sdk)
[Facebook Diagnostics](http://colmdoyle.github.com/fb-diagnostics/)

### Queries

* [App Details](https://graph.facebook.com/ID)
* [Comments](https://graph.facebook.com/comments/?ids=)

### Create App Access Token

[Instructions](https://developers.facebook.com/docs/howtos/login/login-as-app/)

[Browser Link to Return App Token](https://graph.facebook.com/oauth/access_token?client_id=ID&client_secret=SECRET&grant_type=client_credentials)

### Comments Queries

It is impossible to get all comments for the entire domain - we can list the comments and replies
for the set IDs we have. IDs are determined by the URL so this is easy enough to loop through.

An ID is represented as, we can concatenate the URLs

## Twitter

* Twitter account

## Google Plus

* Google + Page

## Pinterest

* Pinterest Page

## YouTube

* YouTube Account

http://thenextweb.com/socialmedia/2014/02/27/make-posts-stand-twitter-facebook-linkedin-complete-guide-social-media-formatting/#!xUWSw