---

heading :
    small : "Transactional email sending"
    title : "Mandrill"

meta :
    author      : "DryKISS"
    description : "CodeBlender - Middleman hand crafted Bootstrap HAML partials"
    image       : "/docs/mandrill/mandrill.jpg"
    subject     : "Email"
    title       : "Mandrill email"
    type        : "article"

category : "business"
date     : 2014-01-20
modified : 2015-10-14
excerpt  : "Mandrill is a reliable, scalable, and secure delivery API for transactional emails from websites and applications. It's ideal for sending data-driven transactional emails, including targeted e-commerce and personalized one-to-one messages."
tags     : [ email, newsletter, marketing ]

---

## Table of Content
* Table of Contents
{:toc}

## Introduction

[Mandrill](http://mandrill.com/) is a transactional email service.
Enabling emails to be sent through a full featured API service

## Development

Use [Middleman](http://middlemanapp.com/) to create a development
environment for the Email Templates.

Creating reusable modules for these makes it easy to change and update
in the future.

The finalised HTML for the templates should then be copy and pasted from the
built middleman folder to Mandrill.

Templates are built in HAML.

## Account

Currently Mandrill does not allow multiple users on a single account.

## Images for Templates

There are two ways to manage images. These can either be embedded into the
template through Base64 encoding. Or pulled from a S3 / Cloudfront bucket.

Optionally images can also be embedded within the Mandrill template when the send is
initiated. This may be useful for the Order Logos.

Steps here would be get the Base64 values for each logo and then dynamically
embed the result into the JSON request.

[Base64 Converter](http://webcodertools.com/imagetobase64converter/Create)

    src="cid:LOGO"

### Templates on Mandrill

They are uploaded to the Mandrill system in two ways, through the
[Website](https://mandrillapp.com/templates) or through an API call.

Simply copy and pasting the HTML generated from
middleman build into the form within Mandrill will update the template.

Identifying a template in the JSON is simply done via its name e.g.

    "template_name" : "NAME",

There are also options to preview and test through the website

## Testing

### Visual Testing

Checking how the mail look in multiple clients can be time consuming, using the
following tools can save constant checking

[Mailchimp Inbox Inspector](http://mailchimp.com/features/inbox-inspector/)
[Litmus](http://litmus.com/)

### Send Testing

Using [Postman](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm?hl=en)
which is a Google Chrome store application; provides us a means to send repeatable JSON
requests to the mandrill API.

It stores a nice history of the sends done in the past.

Can also share the testing others have done in a team by exporting the API
requests that have been created.

### Example JSON

These should be performed within Postman, but are here for guidance:

#### Send

    {
        "key"     : "KEY",
        "async"   : false,
        "message" :
        {
            "html"       : "<p>Example HTML content</p>",
            "text"       : "Example text content",
            "subject"    : "Test from Postman",
            "from_email" : "ian.warner@drykiss.com",
            "from_name"  : "Ian",
            "to"         : [
                {
                    "email" : "ian.warner@drykiss.com",
                    "name"  : "Ian 2"
                }
            ],
            "headers": {
                "Reply-To": "ian.warner@drykiss.com"
            },
            "important"           : false,
            "track_opens"         : true,
            "track_clicks"        : true,
            "tags": [
                "Ian-Test-Send"
            ]
        }
    }

#### Send Template

    {
        "key"              : "KEY",
        "async"            : false,
        "template_name"    : "welcome-type-1",
        "template_content" :
        [
            {
                "name"    : "Ian 2",
                "content" : "Blah Content"
            }
        ],
        "message" :
        {
            "html"       : "<p>Example HTML content</p>",
            "text"       : "Example text content",
            "subject"    : "Test from Postman",
            "from_email" : "ian.warner@drykiss.com",
            "from_name"  : "Ian",
            "to"         : [
                {
                    "email" : "ian.warner@drykiss.com",
                    "name"  : "Ian Warner"
                }
            ],
            "headers": {
                "Reply-To": "ian.warner@drykiss.com"
            },
            "important"           : false,
            "track_opens"         : true,
            "track_clicks"        : true,
            "tags": [
                "Ian-Test-Send"
            ]
        }
    }

#### JSON code to deploy a mandrill template

    {
        "key"              : "KEY",
        "async"            : false,
        "template_name"    : "template1",
        "template_content" : "",
        "message" :
        {
            "subject"    : "Test from Postman - Added Images",
            "from_email" : "ian.warner@drykiss.com",
            "from_name"  : "Ian",
            "to"         : [
                {
                    "email" : "ian.warner@drykiss.com",
                    "name"  : "Ian 2"
                }
            ],
            "headers": {
                "Reply-To" : "ian.warner@drykiss.com"
            },
            "important"    : true,
            "track_opens"  : true,
            "track_clicks" : true,
            "tags" : [
                "Test-Send"
            ],
            "global_merge_vars" : [
                {
                    "name"    : "FNAME",
                    "content" : "Ian 2"
                },
                {
                    "name"    : "POLICYID",
                    "content" : "#3493834343434"
                }
            ],
            "images" : [
                {
                    "type"    : "image/png",
                    "name"    : "LOGO",
                    "content" : "BASE64 Image"
                }
            ]
        }
    }

## Email Template Cheat Sheet

[HTML Emails](http://24ways.org/2009/rock-solid-html-emails/)
[Newsletter Tutorial](http://www.smashingmagazine.com/2010/01/19/design-and-build-an-email-newsletter-without-losing-your-mind/)

* Respect your reader. Don't waste their time or attention.
* Ask nicely first.
* Focus on relevance.
* Design with a goal in mind, so that you'll know if it worked.
* Make unsubscribing easy.
* Code like it's 1999 (literally) and use in-line CSS.
* Always include a plain text version.
* Don't assume that images will be viewed.
* Follow the law.
* Test everything before sending, because you can't take it back.

## Layouts

[MobileMetro](http://www.stampready.net/themeforest/templates/mobilemetro/)
[Email Templates](http://themeforest.net/category/marketing/email-templates)
[Responsive Templates](https://github.com/mailchimp/email-blueprints/tree/master/responsive-templates)

## Pre Flight

This is a method of converting CSS from a file to in-line CSS ready for email sending
[Pre-Flight](http://premailer.dialect.ca/)

## Todo

Write section on learning : https://www.codecademy.com/en/tracks/mandrill