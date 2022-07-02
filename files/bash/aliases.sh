
# typing is hard
alias ls="ls -hsCFlGp --color=auto"
alias untar="tar -xvzf"
alias tmux="tmux -2"
alias lolinit="lolcommits --enable --delay=2 --fork"
alias todo="ack @todo"
alias dirsize="du -h --max-depth=1 | sort -hr"

# Lists the most commonly used commands from your bash history
alias whatamidoing="history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10"

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

# Sudo previous command
alias please='sudo $(history -p \!\!)'

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Because I can't type
alias celar="clear"
alias claer="clear"
alias c="clear"
