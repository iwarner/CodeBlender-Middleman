---

category : "developer"
date     : 2014-01-20
excerpt  : "GIT"
modified : 2014-02-09
tags     : [ git ]
title    : "GIT"

---

* Table of Contents
{:toc}

## Introduction

The next task to tackle is how we get the latest files for the project. These
should all be contained within a [GIT][] repository.

The project manager will set-up the required account. You should then be able to
find and use the SSH Clone URL

Once the project is cloned, it will automatically look for the Library files
in the correct location, test that these do in Sublime.

## Generating an SSH Key

To [Generate an SSH Key][] follow the [GitHub][] instructions.

    $ ssh-keygen -t rsa -C "ian.warner@drykiss.com"
    $ ssh-add id_rsa
    $ pbcopy < ~/.ssh/git/id_rsa.pub

Test
    $ ssh -T git@github.com

Using GitHub and GIT as the versioning choice.

Please read this as an intro into Git usage

* [Git Book](http://git-scm.com/book)

Especially the Basics and Branching chapters.

[Git Set-up](http://git-scm.com/book/en/Getting-Started-First-Time-Git-Setup)
[Git Attributes](http://git-scm.com/docs/gitattributes#_checking-out_and_checking-in)

## Line Endings

[Dealing with Line Endings](https://help.github.com/articles/dealing-with-line-endings)

## GitHub

Repositories
List all the ones currently in the organisation

    $ git clone git@github.com:AlphaFounders/alphafounders.com.git

### Adding New Files

If you have new files, you can add them all with:

    $ git add .

### Update web.wiki

    $ git clone git@github.com:AlphaFounders/alphafounders.com.wiki.git
    $ git status
    $ git commit -am "updates to wiki"
    $ git pull
    $ git push

### Resolving Conflicts

If you have any conflicts you can edit the files and then commit again.

    $ git add {file.txt}
    $ git commit

[Resolving Conflicts](http://www.kernel.org/pub/software/scm/git/docs/v1.7.3/user-manual.html#resolving-a-merge.)

## Delete master branch
    $ cd www
    $ git branch -D master
    $ git push origin :master

## Delete a sub-module
Delete the relevant section from the .gitmodules file.
Delete the relevant section from .git/config.
Run git rm --cached path_to_submodule (no trailing slash).
Commit and delete the now untracked submodule files.

## Example work flow

Make something similar with GitFlow

    git checkout -b develop
    git checkout -b BRANCH

    ...make some changes...
    ...notice develop has been updated...
    ...commit changes to BRANCH...

    git checkout develop
    git pull
    ...bring those changes back into develop...

    git checkout branch
    git rebase develop
    ...make some more changes...

    ...commit them to branch...

    ...merge them into develop...

    git checkout develop
    git pull
    git merge branch
    Same for Master deployment
    git branch -d Bug#12
    git push origin :Bug#12

## Cost

[GitHub Pricing](https://github.com/plans)

## Considerations

* [Git Flow](https://github.com/nvie/gitflow) can provide a better management of a product with set
  guidelines for use for developers.
* http://nvie.com/posts/a-successful-git-branching-model/
* http://nvie.com/posts/a-git-flow-screencast/
* http://nvie.com/posts/gitflow-01-released/
* http://nvie.com/posts/an-upgrade-of-gitflow/

sudo chmod -R +a "group:staff allow list,add_file,search,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity,file_inherit,directory_inherit" /var/www

## Todo

* More information on Commit, Pull, Push, Merge and Branch
* Set up the GIT server on the MAC OSX Server
* Look at using GIT Flow
* Check out - http://blog.goosoftware.co.uk/2012/02/07/quick-git-server/

[GitHub]:https://github.com/
[Generate an SSH Key]:https://help.github.com/articles/generating-ssh-keys
[GIT]:http://git-scm.com/
