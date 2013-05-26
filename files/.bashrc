
function scpp {
  scp "$1" mrchimp@deviouschimp.co.uk:~/public_html/i;
  echo "http://deviouschimp.co.uk/i/$1" > /dev/clipboard
  echo "Copied to clipboard: http://deviouschimp.co.uk/i/$1"
}

export -f scpp

alias ls="ls -CF --color"
alias untar="tar -xvzf"
alias sss="ssh squashsk@squashskills.com"
alias yhs="ssh yaddahos@yaddahost.co.uk"
alias dcs="ssh mrchimp@deviouschimp.co.uk"

if [ -e /usr/share/terminfo/x/xterm/x/xterm-256color ]; then
  export TERM='xterm=256color'
else
  export TERM='xterm-color'
fi

