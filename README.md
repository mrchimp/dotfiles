MrChimp's Dotfiles
==================

 * Vim
 * Bash
 * Tmux

## What does it do?

This is my personal setup so you probably dont want to just clone and use it. There are a lot of comments though so it should be easy for others to reuse.

## Extra Software

Installs a bunch of extra software that I always use.

* vim (editor)
* zsh (shell)
* ack (search rool)
* mdp (used for cheatsheets)
* sushi (file previewer)
* dunst (notifications)

### Window Manager

I use [Regolith Linux](https://regolith-desktop.com/). So set up will:

* Install a Regolith "look" in order to style it all nicely

### Zsh

* Installs oh-my-zsh
* Adds a bunch of alias commands.
* Installs a `~/aliases.sh` file for per-machine aliases.

### Vim

* Adds [Vundle](https://github.com/VundleVim/Vundle.vim) for plugin management and installs some plugins by default (see _vimrc for details).
* Add a whole bunch of colorschemes and enable better colour settings and dark background
* Tabs 2 spaces wide (except in Python files)
* Use line numbers, autoindent, expandtab, fieltype detection, ruler
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

    ./setup.sh

Alternatively, install to another directory

    ./setup.sh /home/foo

## Tidying up ##

Once you've run setup.sh you can delete the code, if you like.

    rm -rf dotfiles
