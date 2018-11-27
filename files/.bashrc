
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LANGUAGE=en_GB.UTF-8

# Save ALL the history
export HISTSIZE=-1
export HISTFILESIZE=-1

unamestr=`uname`

# Set up some colours
source ~/bash/colors.sh

# Because typing "cd .." repeatedly is boring.
up() {
  local x='';
  for i in $(seq ${1:-1}); do
    x="$x../";
  done;
  cd $x;
}

source ~/bash/aliases.sh

# Use Powerline - https://github.com/riobard/bash-powerline
source ~/.bash-powerline.sh

source ~/scripts/pathadd ~/scripts
source ~/aliases.sh
