#!/bin/bash

# typing is hard
alias ls="ls -hsCFlGp --color=auto"
alias untar="tar -xvzf"
alias tmux="tmux -2"
alias lolinit="lolcommits --enable --delay=2 --fork"
alias todo="ack @todo"
alias dirsize="du -h --max-depth=1 | sort -hr"

# Lists the most commonly used commands from your bash history
whatamidoing () {
    history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10
}

# Git shortcuts
alias gits="git status"
alias gita="git add"
alias gitc="git commit"
alias gitd="git diff"
alias gitb="git branch"
alias pushmaster="git push origin master"
alias pushmain="git push origin main"
alias pullmaster="git pull origin master"
alias pullmain="git pull origin main"
alias ggraph="git log --graph --decorate --pretty=oneline"
alias master="git checkout master"
alias main="git checkout main"
alias gituncommit="git reset --soft HEAD^"
alias gitunstage="git reset"
alias gitstaged="git diff --cached"
alias gitctags="git !.git/hooks/ctags"

# Homestead shortcuts
homestead () {
    (cd ~/Homestead && vagrant "$1")
}
alias hu="homestead up"
alias he="homestead edit"
alias hs="homestead ssh"
alias hr="homestead up --reprovision"
alias hp="homestead provision"

# Sudo previous command
alias please='sudo $(history -p \!\!)'

# Because I can't type
alias celar="clear"
alias claer="clear"
alias c="clear"
