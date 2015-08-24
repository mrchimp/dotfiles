
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LANGUAGE=en_GB.UTF-8

unamestr=`uname`

# Set up some colours
red="\033[31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[34m"
nocol="\033[0m"
bold="\033[1m"


# Upload a file to my site and copy the url to the clipboard
function scpp {
  scp "$1" mrchimp@deviouschimp.co.uk:~/public_html/i;
  echo "http://deviouschimp.co.uk/i/$1" > /dev/clipboard
  echo "Copied to clipboard: http://deviouschimp.co.uk/i/$1"
}

export -f scpp

# This is just for my own testing...
function show_colors () {
  echo This is normal text
  echo -e "${red}This colour is red.${nocol}"
  echo -e "${green}This colour is green.${nocol}"
  echo -e "${yellow}This colour is yellow.${nocol}"
  echo -e "${blue}This colour is blue.${nocol}"
  echo -e "${bold}This 'colour' is bold.${nocol}"
}

# Help for git prompt syntax
function gitprompt () {
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
}

# Tmux cheatsheet
function tmuxhelp () {
  echo "Press ctrl+a and then..."
  echo ""
  echo -e "${blue}Tmux Commands${nocol}                             ${blue}Windows (Tab)${nocol}"
  echo -e " ${yellow}List${nocol}    ls                                ${yellow}Create${nocol}      c"
  echo -e " ${yellow}New${nocol}     -s <session>                      ${yellow}Close${nocol}       &"
  echo -e " ${yellow}Attach${nocol}  att -t <session>                  ${yellow}List${nocol}        w"
  echo -e " ${yellow}Kill${nocol}    kill-session -t <session>         ${yellow}Rename${nocol}      , <name>"
  echo -e " ${yellow}Rename${nocol}  rename-session -t <old> <new>     ${yellow}Last${nocol}        l"
  echo -e " ${yellow}Goto${nocol}    # <0-9>                           ${yellow}Next${nocol}        n"
  echo -e "                                           ${yellow}Previous${nocol}    p"
  echo -e ""
  echo -e "${blue}Controls${nocol}                                 ${blue}Panes (Split Window)${nocol}"
  echo -e " ${yellow}Choose${nocol}     w <name>                      ${yellow}Show nums${nocol}   q"
  echo -e " ${yellow}Detach${nocol}     d                             ${yellow}Split Horiz${nocol} \""
  echo -e " ${yellow}List${nocol}       =                             ${yellow}Split Vert${nocol}  %"
  echo -e " ${yellow}Buffer${nocol}     PAGEUPDN                      ${yellow}Pane>Window${nocol} !"
  echo -e " ${yellow}Command${nocol}    : <command>                   ${yellow}Kill${nocol}        x"
  echo -e " ${yellow}Paste${nocol}      p                             ${yellow}Reorganize${nocol}  SPACE"
  echo -e " ${yellow}Copy Mode${nocol}  ESC                           ${yellow}Expand${nocol}      ALT+ARROW"
  echo -e "    - ${yellow}Move${nocol}  hjkl                          ${yellow}Resize${nocol}      CTRL+ARROW"
  echo -e "    - ${yellow}Start${nocol} v                             ${yellow}Resize x n${nocol}  <n> ARROW"
  echo -e "    - ${yellow}Copy${nocol}  y                             ${yellow}Select${nocol}      ARROW"
  echo -e "                                          ${yellow}Previous${nocol}    {"
  echo -e "${blue}Sessions (Set of window)${nocol}                  ${yellow}Next${nocol}        }"
  echo -e " ${yellow}New${nocol}      :new [-s <name>]                ${yellow}Switch${nocol}      o"
  echo -e " ${yellow}Rename${nocol}   $                               ${yellow}Swap${nocol}        ^o"
  echo -e " ${yellow}List${nocol}     s                               ${yellow}Last${nocol}        ;"
  echo -e " ${yellow}Next${nocol}     ("
  echo -e " ${yellow}Previous${nocol} )"
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

# Git shortcuts
alias gits="git status"
alias gita="git add"
alias gitc="git commit"
alias gitd="git diff"
alias gpush="git push origin master"
alias gpull="git pull origin master"

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

# Read a file out loud (strip out text in square brackets)
function tailtalk {
  tail --lines=0 -f $1 \
    | grep --line-buffered -F "PHP Fatal error" \
    | sed -u -e 's/\[[^]]*\]//g' \
    | while read line ; do say $line; echo $line ; done
}
export tailtalk

# Friendly bovine greeting
fortune -s | cowsay

