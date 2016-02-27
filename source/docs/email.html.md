---

heading :
    small : "Creation and usage, focus on Google Apps"
    title : "Email"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Email"
    type   : ""

category : "business"
date     : 2011-02-13
excerpt  : "Email"
modified : 2016-02-27
tags     : [ email, google, gmail ]

---

* Table of contents
{:toc}

## Introduction

- http://www.campaignmonitor.com/guides/mobile/

## Google apps

### DNS settings

Priority Host Points TTL

1        @    aspmx.I.google.com.      1 hour
5        @    alt1.aspmx.I.google.com. 1 hour
5        @    alt2.aspmx.I.google.com. 1 hour
10       @    aspmx2.I.google.com.     1 hour
10       @    aspmx3.I.google.com.     1 hour

### SPF

Host TXT TTL
@    v=spf1 include:_spf.google.com ~all  1 hour

### DKIM

### Site verification

Google require a site verification to use Google apps. I usually prefer to use the
DNS option. Simply adding something like the below should suffice. A TXT value will
be supplied by Google during the set up.

Host TXT TTL
@    google-site-verification=KEY 1 hour

## [Mail tester](http://www.mail-tester.com/)

## [Is Not Spam](http://isnotspam.com/)

## Todo

- Create the markdown table for the options
- https://www.arclab.com/en/kb/email/how-to-read-and-analyze-the-email-header-fields-spf-dkim.html
- https://17hats.uservoice.com/knowledgebase/articles/554766-what-do-i-do-if-my-emails-are-going-to-spam-folder