
# typing is hard
alias ls="ls -hsCFlGp"
alias untar="tar -xvzf"
alias apachelog="tail -f /usr/local/apache/logs/error_log"
alias modfiles="find . -type f -exec chmod 644 {} \;"
alias moddirs="find . -type d -exec chmod 755 {} \;"
alias tmux="tmux -2"
alias art="php artisan"
alias lolinit="lolcommits --enable --delay=2 --fork"
alias todo="ack @todo"

# Lists the most commonly used commands from your bash history
alias whatamidoing="history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10"

# Git shortcuts
alias gits="git status"
alias gita="git add"
alias gitc="git commit"
alias gitd="git diff"
alias gitb="git branch"
alias pushmaster="git push origin master"
alias pullmaster="git pull origin master"
alias ggraph="git log --graph --decorate --pretty=oneline"
alias master="git checkout master"

# Sudo previous command
alias please='sudo $(history -p \!\!)'

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Because I can't type
alias celar="clear"
alias claer="clear"
alias c="clear"
