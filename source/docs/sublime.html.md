---

heading :
    title : "Sublime"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Sublime"
    type   : ""

category : "developer"
date     : 2014-01-20
excerpt  : "Sublime"
modified : 2014-02-09
tags     : [ sublime, text editor ]
title    : "Sublime"

---

* Table of Contents
{:toc}

## Introduction

[Sublime][] is the text / code editor of choice.
It provides a flexible framework for many programming languages.

Please follow the instructions for set-up of your machine [[here|DevelopmentSetup]]

The following is for Sublime Text 2, version 3 may differ so please consult.

## Project Format
{
    "folders":
    [
        {
            "path": "src",
            "folder_exclude_patterns": ["backup"],
            "follow_symlinks": true
        },
        {
            "path": "docs",
            "name": "Documentation",
            "file_exclude_patterns": ["*.css"]
        }
    ],
    "settings":
    {
        "tab_size": 8
    },
    "build_systems":
    [
        {
            "name": "List",
            "shell_cmd": "ls -l"
        }
    ]
}

## Repository
We provide a [repository][] that contains the complete packages for Sublime.
Clone the following repository into the main ~/Dropbox/www/AlphaFounders folder.

~~~bash
git clone git@github.com:AlphaFounders/sublime.alphafounders.com.git
~~~

Symlink this repository over the top of the Sublime Application folder.

For Ubuntu

~~~bash
sudo rm -rf ~/.config/sublime-text-2
ln -s ~"/Dropbox/www/AlphaFounders/sublime.alphafounders.com" ~/.config/sublime-text-2
~~~

For Mac

~~~bash
ln -s /var/www/
~~~

## License
Enter the following license in Help > Enter License

## Packages Installed
The following packages are included in the repository, please keep this list
up to date.

If new packages are to be added to the repository please send a message around
to the team for agreement on this.

Investigate the packages regularly to make sure we are using the best ones
available.

* [Alignment](http://wbond.net/sublime_packages/alignment)
* [Behat](https://github.com/omissis/sublime-behat-syntax)
* [CoffeeLint](https://bitbucket.org/dotCypress/coffeelint)
* CoffeeScript
* DetectSyntax
* DocBlockr
* Dotfiles Syntax Highlighting
* EncodingHelper
* Gist
* Haml
* HTML2Haml
* LESS
* LineEndings
* Markdown Preview
* Package Control
* PHPUnit
* Pretty JSON
* Sass
* SidebarEnhancements
* SublimeLinter
* XDebug

[Sublime]:http://www.sublimetext.com/
[repository]:https://github.com/AlphaFounders/sublime.alphafounders.com

## Additional For Ubuntu Set-up
The latest Sublime 2 has built-in a default built of Python version 2.6.6,
which does not support SSL which is being used by URLlib2.

This becomes a problem for Sublime installation in Linux
with "Markdown Preview" Sublime plugin package, that the package requires SSL
to connect to Github.com.

_Workaround is to install a custom built of Python 2.6.6 that has --with-ssl option._

**First install PyEnv**

~~~bash
cd ~
git clone git://github.com/yyuu/pyenv.git .pyenv
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
pyenv rehash
exec $SHELL
~~~

**Build a custom-built python version 2.6.6**

~~~bash
CONFIGURE_OPTS="--enable-unicode=ucs4 --with-zlib --with-ssl --with-threads --enable-share" pyenv install 2.6.6
pyenv rehash
pyenv shell 2.6.6
rm -rf /tmp/pip-build*
pip install requests
~~~

**Install the python into Sublime**

~~~`bash
cd /opt/sublime_text_2/lib
sudo mv python26.zip{,_}
sudo ln -s ~/.pyenv/versions/2.6.6/lib/python2.6
cd python2.6
ln -s plat-linux{3,2}
~~~

## FAQ

- Symbolic linked folder does not show up in Sublime Text?

    > Go to the *Project* menu, then click *Refresh Folders*