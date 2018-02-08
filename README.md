MrChimp's Dotfiles
==================

 * Vim
 * Bash
 * Tmux

## What does it do?

This is my personal setup so you probably dont want to just clone and use it. There are a lot of comments though so it should be easy for others to reuse.

### Bash

* Install [bash-powerline](https://github.com/riobard/bash-powerline)
* Add a command (dcs) to quickly copy a file to a remote server and copy a public URL to the clipboard (this is set to work with my personal site - you can easily customise this to work with your own server).
* Add a bunch of alias commands. (Again, some of these are personal).
* Get a friendly bovine greeting when opening a terminal.

### Vim

* Adds [Vundle](https://github.com/VundleVim/Vundle.vim) for plugin management and installs some plugins by default (see _vimrc for details).
* Add a whole bunch of colorschemes and enable better colour settings and dark background
* Tabs 2 spaces wide (except in Python files)
* Use line numbers, autoindent, expandtab, fieltype detection, ruler
* Use [Gohu font](http://font.gohu.eu) by default (not included - )
* Shortcuts for colourscheme browsing, code folding, show directory in explorer (windows only)
* Tag list - requires [vim-taglist](http://vim-taglist.sourceforge.net) and [Ctags](http://ctags.sourceforge.net/)
* [NERDTree file browser](https://github.com/scrooloose/nerdtree)

### Tmux

* Use solarized color scheme
* Enable mouse
* Improve status bar
* Use ctrl-a instead of ctrl-b

## Installing ##

> ***Warning!***
>
> Setup.sh will overwrite existing config files without warning!
> Use with caution.

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

## Setup Notes ##

To fix Nautilus on i3: `gsettings set org.gnome.desktop.background show-desktop-icons false`
