
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LANGUAGE=en_GB.UTF-8

unamestr=`uname`

# Set up some colours
#red="\033[31m"
#green="\033[32m"
#yellow="\033[33m"
#blue="\033[34m"
#nocol="\033[0m"
#bold="\033[1m"
source ~/scripts/colors

# Because typing "cd .." repeatedly is boring.
up() {
  local x='';
  for i in $(seq ${1:-1}); do
    x="$x../";
  done;
  cd $x;
}

# typing is hard
alias ls="ls -hsCFlGp"
alias untar="tar -xvzf"
alias dcs="ssh mrchimp@deviouschimp.co.uk"
alias apachelog="tail -f /usr/local/apache/logs/error_log"
alias modfiles="find . -type f -exec chmod 644 {} \;"
alias moddirs="find . -type d -exec chmod 755 {} \;"
alias tmux="tmux -2"
alias art="php artisan"
alias lolinit="lolcommits --enable --delay=2 --fork"

# Git shortcuts
alias gits="git status"
alias gita="git add"
alias gitc="git commit"
alias gitd="git diff"
alias gitb="git branch"
alias pushmaster="git push origin master"
alias pullmaster="git pull origin master"
alias pushdev="git push origin dev"
alias pulldev="git pull origin dev"
alias ggraph="git log --graph --decorate --pretty=oneline"
alias dev="git checkout dev"
alias master="git checkout master"

# Sudo previous command
alias please='sudo $(history -p \!\!)'

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Because I can't type
alias celar="clear"
alias claer="clear"
alias c="clear"

# Friendly bovine greeting
fortune -s | cowsay

# Use Powerline - https://github.com/riobard/bash-powerline
source ~/.bash-powerline.sh

source ~/scripts/pathadd ~/scripts
