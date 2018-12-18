#!/usr/bin/env bash

DEST=${1:-~}
VUNDLE=~/.vim/bundle/Vundle.vim

echo "Copying to $DEST"

echo "  → .ackrc"
cp -r ./files/.ackrc $DEST

echo "  → .bash_prompt"
cp -r ./files/.bash_prompt $DEST

echo "  → .bashrc"
cp -r ./files/.bashrc $DEST

echo "  → .gitconfig"
cp -r ./files/.gitconfig $DEST

echo "  → _vimrc"
cp -r ./files/_vimrc $DEST

echo "  → .vim"
cp -r ./files/.vim $DEST

echo "  → .tmux.conf"
cp -r ./files/.tmux.conf $DEST

echo "  → scripts"
cp -r ./files/scripts $DEST

echo "  → bash"
cp -r ./files/bash $DEST

echo "  → cheatsheets"
cp -r ./files/cheatsheets $DEST

if [ ! -f $DEST/aliases.sh ]; then
  echo "  → aliases"
  cp ./files/aliases.sh $DEST/aliases.sh
fi


echo "Installing bash-powerline - https://github.com/riobard/bash-powerline"
curl -s https://raw.githubusercontent.com/riobard/bash-powerline/master/bash-powerline.sh > ~/.bash-powerline.sh

echo "Installing Vundle - https://github.com/VundleVim/Vundle.vim"
if [ -d "$VUNDLE" ]; then
  cd "$VUNDLE"
  git pull origin master &> /dev/null
  cd - > /dev/null
else
  git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE" &> /dev/null
fi
echo -e "\033[33mTo install Vim plugins run :PluginInstall inside Vim\033[0m"

# Do i3 specific setup id i3 is being used
if hash i3-msg 2>/dev/null; then
  echo "Installing nitrogen and i3blocks..."
  sudo apt install nitrogen i3blocks compton

  echo "Setting up i3blocks volume"
  if cd ~/blocklets; then
    git pull
    cd -
  else
    git clone https://github.com/vivien/i3blocks-contrib.git ~/blocklets
  fi

  echo "  → .config/i3/config"
  cp -r ./files/.config/i3/config ${DEST}/.config/i3/config

  echo "  → .config/compton.conf"
  cp -r ./files/.config/compton.conf ${DEST}/.config/compton.conf

  echo "  → .config/redshift.conf"
  cp -r ./files/.config/redshift.conf ${DEST}/.config/redshift.conf

  echo "  → .i3blocks.conf"
  cp ./files/.i3blocks.conf ${DEST}/.i3blocks.conf

  echo "Reloading i3 config..."
  i3-msg -q reload
  i3-msg -q restart

  if hash redshift-gtk 2>/dev/null; then
    killall redshift
    redshift-gtk &> /dev/null &
  fi
fi

echo -e "\033[32mAll done!\033[0m"
