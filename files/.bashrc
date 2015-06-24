
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LANGUAGE=en_GB.UTF-8

platform='unknown'
unamestr=`uname`

# Set up some colours
#if [[ "$unamestr" == 'Linux' ]]; then
#  platform='linux'
#  red="\e[0;31m"
#  green="\e[0;32m"
#  yellow="\e[0;33m"
#  blue="\e[0;34m"
#  nocol="\e[0m"
#elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='osx'
  red="\[\e[0;31m\]"
  green="\[\e[0;32m\]"
  yellow="\[\e[0;33m\]"
  blue="\[\e[0;34m\]"
  nocol="\[\e[0m\]"
#fi


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

# Tmux cheatsheet
function tmuxhelp () {
  echo "Press ctrl+a and then..."
  echo ""
  echo -e "${blue}Tmux Commands${nocol}                     ${blue}Windows (Tab)${nocol}         "
  echo "                                                        "
  echo "List   ls                        Create      c         "
  echo "New    -s <session>              Close       &         "
  echo "Attach att -t <session>          List        w         "
  echo "Kill   kill-session -t <session> Rename      , <name>  "
  echo "Rename                           Last        l         "
  echo "  rename-session -t <old> <new>  Goto #      <0-9>     "
  echo "                                 Next        n         "
  echo "                                 Previous    p         "
  echo "                                                        "
  echo -e "${blue}Controls${nocol}                         ${blue}Panes (Split Window)${nocol}   "
  echo "                                                        "
  echo "Choose  w <name>                 Show nums   q          "
  echo "Detach  d                        Split Horiz \"         "
  echo "List    =                        Split Vert  %          "
  echo "Buffer  PAGEUPDN                 Pane>Window !          "
  echo "Command : <command>              Kill        x          "
  echo "Paste   ]                                               "
  echo "Copy    [ ... SPACE ... ENTER    Reorganize  SPACE      "
  echo "        Move:  H J K L           Expand      ALT+ARROW  "
  echo "        Start: SPACE             Resize      CTRL+ARROW "
  echo "        Copy:  ENTER             Resize x n  <n> ARROW  "
  echo "                                                        "
  echo -e "${blue}Sessions (Set of window)${nocol}         Select      ARROW      "
  echo "                                 Previous    {          "
  echo "New      :new [-s <name>]        Next        }          "
  echo "Rename   $                       Switch      o          "
  echo "List     s                       Swap        ^o         "
  echo "Next     (                       Last        ;          "
  echo "Previous )                                              "
}

export -f gitprompt

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

# Sudo previous command
alias please='sudo $(history -p \!\!)'

# Create a directory if it doesn't exist and then cd to it
# The comment's longer than the code.
function mcd () {
  test -e $1 || mkdir $1; cd $1;
}

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
  PS1+=" \n ${blue}★ ${nocol} "
}

PROMPT_COMMAND='make_prompt'

# Friendly bovine greeting
fortune -s | cowsay

