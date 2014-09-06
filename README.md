MrChimp's Dotfiles
==================

 * Vim
 * Bash

## What does it do? ##

This is my personal setup so you probably dont want to just clone and use it. There are a lot of comments though so it should be easy for others to reuse.

__Bash__

* Colourise the command prompt.
* Show current username, hostname, current directory and git status in command prompt.
* Add a command to quickly copy a file to a remote server and copy a public URL to the clipboard (this is set to work with my personal site - you can easily customise this to work with your own server).
* Add a bunch of alias commands. (Again, some of these are personal).
* Get a friendly bovine greeting when opening a terminal.

__Vim__

* Add a whole bunch of colorschemes and enable better colour settings and dark background
* Tabs 2 spaces wide (except in Python files)
* Use line numbers, autoindent, expandtab, fieltype detection, ruler
* Use Gohu font by default (not included - http://font.gohu.eu)
* Shortcuts for colourscheme browsing, code folding, show directory in explorer (windows only)
* Tag list - requires vim-taglist (http://vim-taglist.sourceforge.net) and Ctags (http://ctags.sourceforge.net/)
* NERDTree file browser (https://github.com/scrooloose/nerdtree)

## Installing ##

Get the code

    git clone git@github.com/mrchimp/dotfiles
    cd dotfiles

`setup.sh` will copy the files from the git repo into your home folder.

Install to `~` by default.

    sh setup.sh

Alternatively, install to another directory

    sh setup.sh /home/foo

## Tidying up ##

Once you've run setup.sh you can delete the code, if you like.

    rm -rf dotfiles

