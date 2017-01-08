---

<<<<<<< HEAD
heading :
    title : "Network"

meta :
    title  : "Network - CodeBlender"

=======
>>>>>>> updates
category : "infrastructure"
date     : 2014-01-20
excerpt  : "Network"
modified : 2014-02-09
tags     : [ network ]
title    : "Network"

---

* Table of Contents
{:toc}

## Introduction

At the moment we are planning a network of 30 odd Ad-Hoc computers connecting
to a single point of access to enable connection to the Internet.

What we are not planning as much is an internal secure network, where our machines
log onto and persist with. Open or Active Directory for instance would manage
user accounts, settings and home directories.

Other considerations are internal servers, NAS, Printers or other networked
devices.

Key is maintainability, we currently have no Corporate IT, network specialists.
We need to scale though, in terms of our own staff and perhaps users we incubate
or lease seating space too.

## Infrastructure of a Network

### Wired

Pros - much faster, economic, efficient
Cons - cable management, installation, maintenance, cost

We should look at what workstations or groups of users that require the speed and
efficiency of a wired network over wireless.

* Call Centre - requirement for Voice over IP needs faster speeds
* IT - Most developers require the speed in certain tasks like updating sites.

I would expect at some stage that all work areas be connected via wired access.
To promote speed and consistency of connection.

#### Cable Choice

Cables at a length of 100 meters offer the following

* Cat 5  - 100Mb
* Cat 5e - 1GB
* Cat 6  - 1GB
* Cat 6a - 10GB
* Unofficially there is Cat 7 to

Cables can be solid or stranded, generally we will utilise stranded cables within
the office.

Cables can be shielded or not, shielded protects from interference from other
devices and electrics; so will offer greater speeds.

Recommendation
* Cat 6a
* Shielded
* Stranded

### Wireless
Pros - Connected movement, cheap, zero installation
Cons - slower, not consistent, prone to issues

Wireless should be used to provide casual connection to the internet and should
not be relied upon as the sole source for our employees

## Hardware
Computers generally come with Network cards pre-installed. Understanding though
the type and speed is important. i.e. wireless connects at many standards, so
making sure we have compatible computers is key. Network cards also can offer
speeds of up to 1GB these days. As long as the category of cable provides this
too.

* Router
The router is the single access point to the ISPs Modem. We require a business
grade router to connect at least 40 users effectively to it. Through Wired and
Wireless networks.

* Access Points
Expanding the wi-fi signal around the office will increase speed and consistency.

* Cables
Good quality cables and connectors make a massive difference

* Trunking
Concealing and protecting ethernet cable to prevent damage or eyesore

* Hub / Unmanaged Switch / Managed Switch
Hubs transmit all data out all connected ports.  Switches automatically learn the
network layout and then only transmit data where it needs to go, making the network
more efficient. Managed switches add an additional level of configuration and
monitoring capability to a network.

## Security
The router should provide a sophisticated IPSEC model filewall, plus rules we can
add to ban certain protocols, sites, IPs etc.

Check that the administration screen for the router we purchase is in english and
easy to understand.

## Diagnostics
A crucial consideration is how we monitor, maintain and fix network issues quickly.

Running monitoring software over the network is vital to maintain it's health and
alert us of issues without our network.

## Considerations
Primary concern is fast connection to the internet for all users.

Secondary is perhaps isolating and providing consistent connections for a VOIP
server and several users connect to this.

* Plan for 40 Users
* English Admin Router that is easy to follow
* Fast Cabling

## Checklist
1. Investigate and purchase business class router
2. Investigate a supplier of good quality cabling, trunking and

http://www.techspot.com/downloads/5936-inssider.html
