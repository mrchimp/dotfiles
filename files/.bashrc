
# Set up some colours
red="\[\e[0;31m\]"
green="\[\e[0;32m\]"
yellow="\[\e[0;33m\]"
blue="\[\e[0;34m\]"
nocol="\[\e[0m\]"

# Upload a file to my site and copy the url to the clipboard
function scpp {
  scp "$1" mrchimp@deviouschimp.co.uk:~/public_html/i;
  echo "http://deviouschimp.co.uk/i/$1" > /dev/clipboard
  echo "Copied to clipboard: http://deviouschimp.co.uk/i/$1"
}

export -f scpp

# Help for git prompt syntax
function gitprompt () {
  echo ""
  echo "Git status of current directory is shown in command prompt."
  echo "Shows red if repo is dirty, else green."
  echo ""
  echo " >  File renamed"
  echo " ^n Ahead of remote by n commits"
  echo " vn Behind remote by n commits"
  echo " +  New file"
  echo " -  File deleted"
  echo " ~  Modified File"
  echo " ?  Untracked file"
  echo ""
}

export -f gitprompt

# get current git branch
function git_status() {
  status=`git status 2>&1 | tee`
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    if [[ ${status} =~ "modified:" ]]; then
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

# Sudo previous command
alias please="sudo $(history -p \!\!)"

# vim colour fix...i think
if [ -e /usr/share/terminfo/x/xterm/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# Construct a prompt string
make_prompt () {
  # Show current user and host. Red if root, else green
  if [[ $EUID == 0 ]]; then
    PS1="$red\H$nocol"
  else
    PS1="$green\u@\H$nocol"
  fi
  
  # Show current directory
  PS1+=":$yellow\w$nocol"

  # Show git status of current directory.
  PS1+=" $(git_status)"

  # Put input on a new line
  PS1+=" \n\$ "
}

PROMPT_COMMAND='make_prompt'

# Friendly bovine greeting
fortune -s | cowsay

