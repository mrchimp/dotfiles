#!/usr/bin/env bash

DEST=${1:-~}

echo "Installing software. You may be asked for your password"
echo " - vim, zsh, ack"
sudo apt-get install -yq vim zsh ack

echo " - oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Copying to $DEST"

echo "  → .ackrc"
cp -r ./files/.ackrc $DEST

echo "  → .bash_prompt"
cp -r ./files/.bash_prompt $DEST

echo "  → .bashrc"
cp -r ./files/.bashrc $DEST

echo "  → .zshrc"
cp -r ./files/.zshrc $DEST

echo "  → .gitconfig"
cp -r ./files/.gitconfig $DEST

echo "  → _vimrc"
cp -r ./files/_vimrc $DEST

echo "  → .vim"
cp -r ./files/.vim $DEST

echo "  → .tmux.conf"
cp -r ./files/.tmux.conf $DEST

echo "  → .zshrc"
cp -r ./files/.zshrc $DEST

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

echo -e "\033[32mAll done!\033[0m"
