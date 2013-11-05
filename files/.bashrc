# Upload a file to my site and copy the url to the clipboard
function scpp {
  scp "$1" mrchimp@deviouschimp.co.uk:~/public_html/i;
  echo "http://deviouschimp.co.uk/i/$1" > /dev/clipboard
  echo "Copied to clipboard: http://deviouschimp.co.uk/i/$1"
}

export -f scpp

# typing is hard
alias ls="ls -hsCFlGp"
alias untar="tar -xvzf"
alias sss="ssh squashsk@squashskills.com"
alias yhs="ssh yaddahos@yaddahost.co.uk"
alias dcs="ssh mrchimp@deviouschimp.co.uk"
alias logs="tail -f /usr/local/apache/logs/error_log"
alias modfiles="find . -type f -exec chmod 644 {} \;"
alias moddirs="find . -type d -exec chmod 755 {} \;"

# vim colour fix...i think
if [ -e /usr/share/terminfo/x/xterm/x/xterm-256color ]; then
  export TERM='xterm=256color'
else
  export TERM='xterm-color'
fi

# Make the prompt easier on the eye
export PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\H \[\e[33m\]\w\[\e[0m\]\n\$ "

# Friendly bovine greeting
fortune -s | cowsay
