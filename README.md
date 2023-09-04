# MrChimp's Dotfiles

## What does it do?

This is my personal setup for various things on Linux. You dont want to just clone and use it but there are a lot of comments so you should be able to see what's going on if you're into that thing.

## Extra Software

- git (version control)
- Tilix (terminal)
- htop (system monitor)
- nodejs, nmp and n (javascript is everywhere and cannot be stopped)
- neovim (editor, aliased to "vim")
- Laravel Homestead, vagrant and virtualbox (virtual dev environment)
- gh (Github command line)
- zsh (shell)
- ack (search rool)
- mdp (used for cheatsheets)
- sushi (file previewer)
- VS Code

### Zsh

- Sets zsh as the default shell
- Installs oh-my-zsh
- Adds a bunch of alias commands in `~/bash/aliases.sh`.
- Installs a `~/aliases.sh` file for per-machine aliases.

### Tmux

- Use solarized color scheme
- Enable mouse
- Improve status bar
- Use ctrl-a instead of ctrl-b

## Installing

> **_Warning!_**
>
> Setup.sh will overwrite existing config files without warning!
> Use with caution.

Get the code

`setup.sh` will copy the files from the git repo into your home folder.

```sh
./setup.sh
```
