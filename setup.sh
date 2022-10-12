#!/usr/bin/env bash

DEST=${1:-~}

echo "Installing software"
echo -n "→ vim, zsh, ack, mdp, sushi ... "
sudo apt-get -yqq install vim zsh ack mdp gnome-sushi dconf-cli uuid-runtime dunst
echo -e "\e[32mok\e[0m"

echo -n "→ oh-my-zsh ... "

if [ -z $ZSH ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo -e "\e[32mok\e[0m"
else
  echo -e "\e[33mSkipped. Already installed.\e[0m"
fi

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

echo -n "→ .config/regolith/i3/config ... "
cp ./files/.config/regolith/i3/config $DEST/.config/regolith/i3/config
echo -e "\e[32mok\e[0m"

echo -n "→ .zshrc ... "
cp -r ./files/.zshrc $DEST
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

echo -n "→ dunst ..."
mkdir -p ~/.config/dunst
cp ./files/.config/dunst/config ~/.config/dunst/dunstrc
echo -e "\e[32mok\e[0m"

echo -n "→ cheatsheets ... "
cp -r ./files/cheatsheets $DEST
echo -e "\e[32mok\e[0m"

if [ ! -f $DEST/aliases.sh ]; then
  echo -n "→ aliases ... "
  cp ./files/aliases.sh $DEST/aliases.sh
  echo -e "\e[32mok\e[0m"
fi

if command -v regolith-look &> /dev/null 
then
  echo "→ installing regolith look ... "
  sudo mkdir -p /usr/share/regolith-look/mrchimp
  sudo cp ./regolith-look-mrchimp/* /usr/share/regolith-look/mrchimp/
  regolith-look refresh
  echo -e "\e[32mok\e[0m"
  sleep 2
fi

echo "→ Installing gogh for terminal colours ... "
git clone --quiet https://github.com/Gogh-Co/Gogh.git gogh
cd gogh/themes

# necessary on ubuntu
export TERMINAL=gnome-terminal

# install themes
./darkside.sh
cd ../..
echo -e "\e[32mok\e[0m"

echo "→ Testing notifications..."
killall dunst &> /dev/null
notify-send "This is a notification. Hi!"
