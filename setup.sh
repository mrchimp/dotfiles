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

echo "  → _vimrc"
cp -r ./files/_vimrc $DEST

echo "  → .vim"
cp -r ./files/.vim $DEST

echo "  → .tmux.conf"
cp -r ./files/.tmux.conf $DEST

echo "  → scripts"
cp -r ./files/scripts $DEST

echo "  → cheatsheets"
cp -r ./files/cheatsheets $DEST

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

# Do i3 specific setup
if hash i3-msg 2>/dev/null; then
  echo "Installing nitrogen and i3blocks..."
  sudo apt install nitrogen i3blocks

  echo "  → .config/i3/config"
  cp -r ./files/.config/i3/config ${DEST}/.config/i3/config

  echo "Reloading i3 config..."
  i3-msg -q reload
  i3-msg -q restart
fi

echo -e "\033[32mAll done!\033[0m"
