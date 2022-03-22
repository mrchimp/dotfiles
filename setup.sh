#!/usr/bin/env bash

DEST=${1:-~}

echo "Installing software"
echo -n "→ vim, zsh, ack ... "
sudo apt-get -yqq install vim zsh ack
echo -e "\e[32mok\e[0m"

echo -n "→ oh-my-zsh ... "

if [ -z $ZSH ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo -e "\e[32mok\e[0m"
else
  echo -e "\e[33mSkipped. Already installed.\e[0m"
fi

echo -n "→ bash-powerline ... "
curl -s https://raw.githubusercontent.com/riobard/bash-powerline/master/bash-powerline.sh > ~/.bash-powerline.sh
echo -e "\e[32mok\e[0m"

echo ""
echo "Copying files to $DEST"

echo -n "→ .ackrc ... "
cp -r ./files/.ackrc $DEST
echo -e "\e[32mok\e[0m"

echo -n "→ .bash_prompt ... "
cp -r ./files/.bash_prompt $DEST
echo -e "\e[32mok\e[0m"

echo -n "→ .bashrc ... "
cp -r ./files/.bashrc $DEST
echo -e "\e[32mok\e[0m"

echo -n "→ .zshrc ... "
cp -r ./files/.zshrc $DEST
echo -e "\e[32mok\e[0m"

echo -n "→ .gitconfig ... "
cp -r ./files/.gitconfig $DEST
echo -e "\e[32mok\e[0m"

echo -n "→ _vimrc ... "
cp -r ./files/_vimrc $DEST
echo -e "\e[32mok\e[0m"

echo -n "→ .vim ... "
cp -r ./files/.vim $DEST
echo -e "\e[32mok\e[0m"

echo -n "→ .tmux.conf ... "
cp -r ./files/.tmux.conf $DEST
echo -e "\e[32mok\e[0m"

echo -n "→ .zshrc ... "
cp -r ./files/.zshrc $DEST
echo -e "\e[32mok\e[0m"

echo -n "→ scripts ... "
cp -r ./files/scripts $DEST
echo -e "\e[32mok\e[0m"

echo -n "→ bash ... "
cp -r ./files/bash $DEST
echo -e "\e[32mok\e[0m"

echo -n "→ cheatsheets ... "
cp -r ./files/cheatsheets $DEST
echo -e "\e[32mok\e[0m"

if [ ! -f $DEST/aliases.sh ]; then
  echo -n "→ aliases ... "
  cp ./files/aliases.sh $DEST/aliases.sh
  echo -e "\e[32mok\e[0m"
fi
