---

heading :
    small : "Location based taxi ordering."
    title : "Beep Taxi"

meta :
    author      : "Ian Warner"
    description : "Beep Taxi - description"
    image       : "portfolio/wd.png"
    subject     : "Beep Taxi - subject"
    title       : "Beep Taxi - title"
    type        : "article"

category  : Site
date      : 2013-01-01
excerpt   : Beep Taxi - excerpt
lang      : en
modified  : 2013-01-01
published : false
tags      : [ SMS, Mobile ]

---

# Project Overview

Beep Taxi was a revolutionary automated taxi ordering system. Created in 2005 it
included most of the mechanics we now see on Uber or Hailo. However the
smartphone was not in existence then!

At its basic level it matched client to taxi through various means including;
mobile triangulation; postcode voice recognition and GPS if available.
It would then match the nearest driver and route the call directly to their
hands free mobile.

Beep was all about putting the user in control. Providing safety options such as
call recording and constant taxi tracking.

Beep would simply take &pound;1 per journey.

Unfortunately due to lack of funding Beep Taxi was closed in 2007; it's a shame
to think that Britain could have had a billion dollar business like Uber in
2005, if back then we had the investment mentality like in the US.

## What we did

DryKISS as a partner; were tasked with the technical architecture and development
of this complex system.

Firstly we needed to track the Taxi, to do this a custom GPS / GSM device was
manufactured and installed in over 100 test taxis in Reading. A basic toggle
switch alerted the system of the vehicle's availability. Each was also fitted
with a SIM to provide the location data we required.

To locate the client we crafted an IVR platform that provided all the options the
user would need to book a taxi. If they called on a mobile phone we would instantly
locate them; a land line, prompted the IVR to ask for a postcode through voice
recognition. Additional prompts asked if they wanted the taxi now or in the future.
Culminating in the call being routed to the nearest available Beep driver, to give
reassurance of pick-up time and location.

An after journey rating system was created by sending the user an SMS, they simply
needed to reply with a 1-5 score.

Lastly a complex back office and API platform was developed to handle all the
IVR information; GPS data from the taxis and order routing. Algorithms processed
the best taxi for the user based on distance, ratings and journey time. A full
reporting engine gave the business the transparency of best drivers, popular pick
up areas and advocate customers. Also the means to invoice and track payments from
drivers.

## Press

http://www.getreading.co.uk/news/local-news/now-you-can-beep-you-4263837
