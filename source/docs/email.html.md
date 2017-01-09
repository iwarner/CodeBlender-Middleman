---

category : "business"
date     : 2011-02-13
excerpt  : "Email"
modified : 2016-02-27
tags     : [ email, google, gmail ]
title    : "Email"

---

* Table of contents
{:toc}

## Introduction

- http://www.campaignmonitor.com/guides/mobile/

## Google apps

### DNS settings

Priority    Mail Server
1   ASPMX.L.GOOGLE.COM.
5   ALT1.ASPMX.L.GOOGLE.COM.
5   ALT2.ASPMX.L.GOOGLE.COM.
10  ALT3.ASPMX.L.GOOGLE.COM.
10  ALT4.ASPMX.L.GOOGLE.COM.

https://support.google.com/quickfixes/answer/6252374?rd=1
https://support.google.com/a/answer/33915?hl=en
https://support.google.com/a/answer/174125

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

INTRODUCTION
------------

# URL : http://www.google.com/apps

# Creating a new Google Apps account.

  It is also possible to purchase a domain through Google
  The domain is purchased through GoDaddy

  URL : https://www.google.com/a/cpanel/domain/new

OPTIONS
-------

# You have the option of using the Google interface to read and send emails or
  download email onto your desktop client such as Outlook or Imail.

DESKTOP SETUP
-------------

# Downloading mail to a desktop application

  Google Apps Setup

  01. Log into your Google apps Account.
  02. Click Settings; located top right of the screen
  03. Click the Tab Forwarding and POP/IMAP
  04. Click the radio button Enable IMAP and click Save Changes

  Outlook Setup

  01. Open up Outlook
  02. Select Tools -> Email Accounts - or something similar depending on version.
  03. Select add a new email account from the dialog.
  04. Server Type should be IMAP
  05. You will want to check Manually configure server settings

  Email    :
  Username :
  Password : ...

  Incoming mail server : imap.gmail.com.
  Outgoing mail server : smtp.gmail.com.

  06. Once the initial setup is complete you will likely need to go back into the accounts
      Click More settings and onto the advanced tab.

  Incoming mail server port : 993 - select SSL encryption
  Outgoing mail server port : 587 - select TLS encryption

  07. Click the outgoing server tab and select Outgoing server requires authentication
      and select Use the same settings as my incoming server

  iMail Setup

  This should be very similar to the above in terms of what information needs adding.

DNS SETTINGS
------------

  01. To make sure that mail is delivered into the Google Apps system the correct DNS
      settings need to applied to the domain name.

      Add the following DNS records to the domain

      Priority    Mail server
      1           ASPMX.L.GOOGLE.COM
      5           ALT1.ASPMX.L.GOOGLE.COM
      5           ALT2.ASPMX.L.GOOGLE.COM
      10          ASPMX2.GOOGLEMAIL.COM
      10          ASPMX3.GOOGLEMAIL.COM

MOVING DNS
----------

  01. Moving from GOL requires the following

      Return the DNS hosts back to Easily.
      There is a button within the Easily account next to the domain to return the domain to the Easily nameservers

      Add the Google Mail DNS settings to the domain

      Add the necessary site records to the DNS usually:
      footyjapan.com
      *.footyjapan.com

      Point these to the correct DNS

CHECK MX RECORDS
----------------

  01. Use the following site to check the domain names:

      http://www.mxtoolbox.com/

  02. Current records are:

      10 cfx01.new-core.com 202.191.118.31  24 hrs  SMTP Test   Blacklist Check
      20 cfx02.new-core.com 202.191.118.32  24 hrs  SMTP Test   Blacklist Check
      30 ms001s.new-core.com    202.191.119.36  24 hrs  SMTP Test   Blacklist Check

TIMELINES and OPTIONS
---------------------

  01. First option is to ask GOL to put in the Google Apps DNS this will mean we do not need
      to wait for the name servers to be changed back to Easily.

  02. Changing DNS back to Easily - this can take up to 24 hrs.
      As soon as they are back with Easily we can put in the correct DNS
      There may be some mail loss if the server looks at Easily for records before they have been created
      Usually though the mail server should keep the mail for 48 hrs before trying to send again.

  Basically if I do the DNS ASAP then mail will be delivered to the Google System and mail can be read
  and sent via GMail - setting up Outlook or Imail can be done afterwards.
