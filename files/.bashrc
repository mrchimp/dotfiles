
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

# get current git branch
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]"
  else
    echo ""
  fi
}

# get git status
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -m "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -m ${status} 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -m "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
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
  export TERM='xterm=256color'
else
  export TERM='xterm-color'
fi

make_prompt () {
  PS1=''
  if [[ $EUID == 0 ]]; then
    PS1+="$red\H$nocol"
  else
    PS1+="$green\u@\H$nocol"
  fi
  PS1+=":$yellow\w$nocol"
  PS1+=" $blue$(parse_git_branch)$nocol"
  PS1+=" \n\$ "
}

PROMPT_COMMAND='make_prompt'

# Make the prompt easier on the eye

# Friendly bovine greeting
fortune -s | cowsay

