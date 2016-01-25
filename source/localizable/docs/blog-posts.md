---

heading :
    small : "Blog post"
    title : "Blog post"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Blog post"
    type   : ""

category : "user-experience"
date     : 2014-01-20
excerpt  : "Blog post"
modified : 2014-02-09
tags     : [ blog ]

---

## Table of Contents
* Table of Contents
{:toc}

## Why we need to markdown content?

### It is easy and convenient to use
By using [Markdown][] everybody can easily learn to create blog posts.

### It is better to manage
[Markdown][] blogs are easier to manage than any other kind of blogging technique,
which makes the IT department happy ;-).

### It is SEO optimized
[Markdown][] blogs are SEO optimized, hence it is easier for Google to analyse your
website which will ideally result in a better search rank.

## Getting started

### 1. Install Sublime Text
1. Download sublime from the following link: [Sublime 2][]

2. Install sublime on your hard drive

3. Install license code

On a Mac this should be pasted into the enter license section in the **help**
tab.

    ----- BEGIN LICENSE -----
    Ian Warner
    Single User License
    EA7E-802260
    88C3FD7D 3A9D24FD 48CD9802 FA28ABD9
    C9ED4B2C 339B9D54 5488AC14 21D1F9B6
    8BD2A1D3 E750DFB0 504BF1C5 2C3E243E
    45F3317D 9F55578C 0A590910 13861C94
    3684FF1D 529DD4C0 A5DB390F 12AFBE3B
    A931DFAA A50383A2 8B500D83 7DBA9833
    752BF1BD 6D6F04E5 B58E2772 D60B9D8E
    04F34FCC C2EB5A14 F8160845 7D9722A8
    ------ END LICENSE ------

4. Get sublime package control code and enter it into the console
[Package Control Download][]

5. Restart Sublime

6. Now you are ready to go

### 2. Create a folder structure
1. First create a folder for the website you are writing content about. Examples are:
    - Askhanuman
    - One2Check
    - HansaLED

2. Create sub-folders for the respective kind of post. Examples are:
    - News
    - Information
    - Reviews
    - FAQ
    - Insurers OR Banks

2. Create sub-folders for multi-languages. Examples are:
    en
    th

### 3. Correct file naming
1. Correct file naming includes the date when the blog was "kramdowned" as well
   as the title of the post. The file needs to have the ending .md
    Example: Today is 2nd of July 2013 and my article is about markdown.
    Hence the correct file naming would be the following:
    2013-07-02-markdown.md

### 4. Must read

#### Cheat Sheet
[Cheat Sheet][]

#### Middleman
[Middleman][]

#### TOP 5 SEO Techniques
[TOP 5 SEO techniques][]

#### Meta Tags
[Meta Tags][]

### 5. Example
Let's say we want to create an english FAQ post for our venture AskHanuman.
The post is about how our service works. Today is the 3rd of July 2013.
So how to get started?

#### 5.1 Create folder structure
Askhanuman --> FAQ --> en

#### 5.2 Create markdown file and save it in the respective folder
2013-07-03-how-does-our-service-work.md

#### 5.3 Create middleman headline

    ---
    country     : th
    lang        : en
    category    : insurance
    product     : car insurance
    subcategory : faq
    sticky      : true
    title       : How our service works
    tags        : [Ask Hanuman, car insurance, service]
    published   : true

    description : How our service works
    keywords    : [Ask Hanuman, car insurance, service]
    author      : Andre
    ---

#### 5.4 Start writing content

    ##### How our service works
    - first the customer comes to the homepage
    - he chooses a car and coverage
    - we prove him the policy
    - done

#### 5.5 Save your markdown article

#### 5.6 Track articles you transformed into markdown
Use google sheet named "Markdown transformation" to track the progress.
It is important not to loose any content we have created

#### 5.7 That's it!

[Markdown]:http://daringfireball.net/projects/markdown/ "Markdown"
[Sublime 2]:http://www.sublimetext.com/2 "Download Me"
[Cheat Sheet]: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet "Cheat Me"
[Middleman]: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet "Middleman"
[TOP 5 SEO techniques]: http://www.pushon.co.uk/articles/top-5-white-hat-and-black-hat-search-optimisation-techniques/ "TOP 5 SEO techniques"
[Meta Tags]: http://www.w3schools.com/tags/tag_meta.asp "Meta Tags"
[Package Control Download]: http://wbond.net/sublime_packages/package_control/installation "Download Package"