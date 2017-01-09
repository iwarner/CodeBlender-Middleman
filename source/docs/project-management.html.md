---

category : "business"
date     : 2014-01-20
excerpt  : "Project management"
modified : 2014-02-09
tags     : [ project-management ]
title    : "Project management"

---

* Table of Contents
{:toc}

## Asana

Asana is the project management and bug tracking tool of choice
for Alpha Founders. Understanding the mechanics and best usage
policy is vital for the smooth running of the projects

Please read the [Asana Guide](http://asana.com/guide/) to fully
understand the power of the tool.

### Assigning

[Task Assignment](http://asana.com/guide/tasks/assigning)

### Priorities

[Priorities](http://asana.com/guide/inbox/mytasks-mypriority)
can be created by the person creating the task and also
the person owning it.

It is important to track your own tasks on a daily basis to stay
on top of the wishes of management.

## Task Flow

* All development tasks should initially be assigned to the CTO
    * The CTO will establish the validity of the work package
    * Change the ticket into a Story if not already
        * Add additional details for the understanding of the development team
        * Establish if this needs subtasks, add them
    * Communicate with the development team on the work effort involved to complete
    * Update the ticket with the effort agreed and communicate this back to the PM
    * Decide then in what Version this should go into
    * Assign the ticket to the developer most able to do the work.
    * Developer will take a branch of the develop branch, named after the Task ID
* On completion of the ticket by the developer
    * They will mark the ticket as resolved
    * Assign the ticket back to the PM
    * Merge back into the develop branch
    * Deploy onto the development server
* It is the PM duty to organise QA
    * If it fails QA then assign back to the Tech Lead adding notes / screens on how it failed
    * If it passes then close the ticket
* When the ticket is closed it will be put in the queue for merging back into master and deployed onto production.

## Considerations

* Lean documentation - thorough process
* Follow convention over configuration
* Utilise Scrum - Tuesday to Tuesday - maybe weekly or fortnightly.
    * Each task should be written as a Story
        * As a user....
    * Each scrum should end with a deployable package to iOS and Web.
    * We can do time based tasks or story points

# Communication

Skype and Google Hangouts should be set-up for each employee
