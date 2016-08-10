
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

# get current git branch
function git_status() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]; then
    git_status=`git status 2>&1 | tee`
    STAT=`parse_git_dirty`

    if [[ ${git_status} =~ "working directory clean" ]]; then
      echo "$green${BRANCH}${STAT}$nocol"
    else
      echo "$red${BRANCH}${STAT}$nocol"
    fi
  else
    echo ""
  fi
}

# get git status
function parse_git_dirty {
  branch=`git rev-parse --abbrev-ref HEAD`
  git_status="$(git status 2> /dev/null)"
  bits=""

  if [[ ${git_status} =~ "renamed:" ]]; then
    bits=">${bits}"
  fi

  ahead_pattern="Your[[:space:]]branch[[:space:]]is[[:space:]](ahead|behind).*by[[:space:]]([[:digit:]])"
  if [[ ${git_status} =~ ${ahead_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      bits="^${BASH_REMATCH[2]}${bits}"
    else
      bits="v${BASH_REMATCH[2]}${bits}"
    fi
  fi

  if [[ ${git_status} =~ "new file:" ]]; then
    bits="+${bits}"
  fi

  if [[ ${git_status} =~ "deleted:" ]]; then
    bits="-${bits}"
  fi

  if [[ ${git_status} =~ "modified:" ]]; then
    bits="~${bits}"
  fi

  if [[ ${git_status} =~ "Untracked files" ]]; then
    bits="?${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
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
alias ack="ack-grep"
alias c="clear"

# Git shortcuts
alias gits="git status"
alias gita="git add"
alias gitc="git commit"
alias gitd="git diff"
alias gitb="git branch"
alias gpush="git push origin master"
alias gpull="git pull origin master"

# Sudo previous command
alias please='sudo $(history -p \!\!)'

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Construct a prompt string
make_prompt () {
  # Show current user and host. Red if root, else green
  if [[ $EUID == 0 ]]; then
    PS1="\[$red\]\H\[$nocol\]"
  else
    PS1="\[$green\]\u@\H\[$nocol\]"
  fi

  # Show current directory
  PS1+=":\[$yellow\]\w\[$nocol\]"

  # Show git status of current directory.
  PS1+=" $(git_status)"

  # Put input on a new line
  PS1+=" \n \[${blue}\]⚡ \[${nocol}\] "
}

PROMPT_COMMAND='make_prompt'

# Friendly bovine greeting
fortune -s | cowsay

source ~/scripts/pathadd ~/scripts
