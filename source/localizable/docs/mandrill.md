---

heading :
    small : "Alerting"
    title : "Alerting"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Alerting"
    type   : ""

date     : 2014-01-20
excerpt  : "Alerting"
modified : 2014-02-09
tags     : [ alerting ]

---

## Table of Content
* Table of Contents
{:toc}

## Introduction
[Mandrill](http://mandrill.com/) is a transactional email service.
Enabling us to send emails through a fleshed out API service

## Development
We use [Middleman](http://middlemanapp.com/) to create a development
environment for the Email Tempaltes.

Creating reusable modules for these makes it easy to change and update
in the future.

The finalised HTML for the templates should then be copy and pasted from the
built middleman folder to Mandrill.

Templates are built in HAML.

## Asana Tasks
Other information and history on our Emails may be viewed below:
[Create Mandrill Transaction Mails](https://app.asana.com/0/5797843986265/5802018366196)

## Accounts
Currently Madrill does not allow multiple users on a single account.
Please use the credentials below:

* URL  : [Mandrill](http://mandrill.com/)
* User :
* Pass :

## Images for Templates
There are two ways to manage images. These can either be embedded into the
template through Base64 encoding. Or pulled from a S3 / Cloudfront bucket.

## Templates
The following are the required templates and naming convention for each.

The first three templates in this list are the most important to work on as
they represent the templates to be triggered from the front-end website.

With each template is a description of when the email should be triggered.

### Templates on Mandrill
They are uploaded to the Mandrill system in two ways, through the
[Website](https://mandrillapp.com/templates) or through an API call.

Simply copy and pasting the HTML generated from
middleman build into the form within Mandrill will update the template.

Identyfying a template in the JSON is simply done via its name e.g.

    "template_name"    : "welcome-type-1",

There are also options to preview and test throught the website

## Images
Optionally images can also be embedded within the Mandrill template when the send is
iniatied. This may be useful for the Order Logos.

Steps here would be get the Base64 values for each logo and then dynamically
embed the result into the JSON request.

[Base64 Converter](http://webcodertools.com/imagetobase64converter/Create)

    src="cid:LOGO"

## Testing

### Visual Testing
Checking how the mail look in multiple clients can be time consuming, using the
following tools can save constant checking

[Mailchimp Inbox Inspector](http://mailchimp.com/features/inbox-inspector/)
[Litmus](http://litmus.com/)

### Sending Testing
Using [Postman](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&ved=0CCsQFjAA&url=https%3A%2F%2Fchrome.google.com%2Fwebstore%2Fdetail%2Fpostman-rest-client%2Ffdmmgilgnpjigdojojpjoooidkmcomcm%3Fhl%3Den&ei=wkPNUZjsJ8uciAffmoGQDA&usg=AFQjCNHaecLwAKk91gpdCY_y1x_ViIrHwQ&sig2=hXtfUb5iYq_wDP26S4qqAQ&bvm=bv.48572450,d.aGc)
which is a Google Chrome application, provides us a means to send repeatable JSON
requests to the mandrill API.

It stores a nice history of the sends we have also done in the past too.

We can also share the testing others have done in the team by exporting the API
requests that have been created. The following is the latest
[Postman Collection](http://www.getpostman.com/collections/98c298b15ac2ab7926f0)

### Example JSON
These should be performed within Postman, but are here for guidance:

#### Send

    {
        "key"     : "CmoX5ZFPxAPo2ujoA-P_Vw",
        "async"   : false,
        "message" :
        {
            "html"       : "<p>Example HTML content</p>",
            "text"       : "Example text content",
            "subject"    : "Test from Ian Postman",
            "from_email" : "ian@alphafounders.com",
            "from_name"  : "Ian",
            "to"         : [
                {
                    "email" : "andre@alphafounders.com",
                    "name"  : "Andre"
                }
            ],
            "headers": {
                "Reply-To": "ian@alphafounders.com"
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
        "key"              : "CmoX5ZFPxAPo2ujoA-P_Vw",
        "async"            : false,
        "template_name"    : "welcome-type-1",
        "template_content" :
        [
            {
                "name"    : "Andre",
                "content" : "Blah Content"
            }
        ],
        "message" :
        {
            "html"       : "<p>Example HTML content</p>",
            "text"       : "Example text content",
            "subject"    : "Test from Ian Postman",
            "from_email" : "ian@alphafounders.com",
            "from_name"  : "Ian",
            "to"         : [
                {
                    "email" : "andre@alphafounders.com",
                    "name"  : "Andre"
                },
                {
                    "email" : "iwarner@triangle-solutions.com",
                    "name"  : "Ian Warner"
                }
            ],
            "headers": {
                "Reply-To": "ian@alphafounders.com"
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
        "key"              : "CmoX5ZFPxAPo2ujoA-P_Vw",
        "async"            : false,
        "template_name"    : "acceptedinsuredtype1",
        "template_content" : "",
        "message" :
        {
            "subject"    : "Test from Ian Postman - Added Images",
            "from_email" : "ian@alphafounders.com",
            "from_name"  : "Ian",
            "to"         : [
                {
                    "email" : "iwarner@triangle-solutions.com",
                    "name"  : "Ian Warner"
                }
            ],
            "headers": {
                "Reply-To" : "ian@alphafounders.com"
            },
            "important"    : true,
            "track_opens"  : true,
            "track_clicks" : true,
            "tags" : [
                "Ian-Test-Send"
            ],
            "global_merge_vars" : [
                {
                    "name"    : "FNAME",
                    "content" : "Andre"
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
                    "content" : "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"
                },
                {
                    "type"    : "image/png",
                    "name"    : "GREETINGS",
                    "content" : "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"
                }
            ]
        }
    }

## Email Template Cheat Sheet
[HTML Emails](http://24ways.org/2009/rock-solid-html-emails/)
[Newsletter Tutorial](http://www.smashingmagazine.com/2010/01/19/design-and-build-an-email-newsletter-without-losing-your-mind/)

* Respect your reader. Don’t waste their time or attention.
* Ask nicely first.
* Focus on relevance.
* Design with a goal in mind, so that you’ll know if it worked.
* Make unsubscribing easy.
* Code like it’s 1999 (literally) and use inline CSS.
* Always include a plain text version.
* Don’t assume that images will be viewed.
* Follow the law.
* Test everything before sending, because you can’t take it back.

## Layouts
[MobileMetro](http://www.stampready.net/themeforest/templates/mobilemetro/)
[Email Templates](http://themeforest.net/category/marketing/email-templates)
[Responsive Templates](https://github.com/mailchimp/email-blueprints/tree/master/responsive-templates)

## Pre Flight
This is a method of converting CSS from a file to inline CSS ready for email sending
[Pre-Flight](http://premailer.dialect.ca/)