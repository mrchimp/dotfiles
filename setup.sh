#!/usr/bin/env bash

DEST=${1:-~}

echo -n "Making somewhere to store code ... "
mkdir -p ~/code
echo -e "\e[32mok\e[0m"

echo -n "Enabling universe repository ... " # Needed for fonts-firacode
sudo add-apt-repository universe
echo -e "\e[32mok\e[0m"

echo -n "Updating everything ... "
sudo apt-get -qq update
sudo apt-get -qq upgrade
echo -e "\e[32mok\e[0m"

echo "Installing software"
echo -n "→ git tilix zsh htop nodejs npm neovim gh ack mdp gnome-sushi dconf-cli uuid-runtime fonts-firacode ... "
sudo apt-get -qq install git tilix zsh htop nodejs npm neovim gh ack mdp gnome-sushi dconf-cli uuid-runtime fonts-firacode
echo -e "\e[32mok\e[0m"

echo -n "→ oh-my-zsh ... "
if [ -z "$ZSH" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo -e "\e[32mok\e[0m"
else
    echo -e "\e[33mAlready installed.\e[0m"
fi

echo -n "→ oh-my-zsh-theme ..."
cp ./files/oh-my-zsh/jake.zsh-theme ~/.oh-my-zsh/custom/themes/jake.zsh-theme
echo -e "\e[32mok\e[0m"

echo ""
echo "Copying files to $DEST"

echo -n "→ .ackrc ... "
cp -r ./files/.ackrc "$DEST"
echo -e "\e[32mok\e[0m"

echo -n "→ .bashrc ... "
cp -r ./files/.bashrc "$DEST"
echo -e "\e[32mok\e[0m"

echo -n "→ .zshrc ... "
cp -r ./files/.zshrc "$DEST"
echo -e "\e[32mok\e[0m"

echo -n "→ .tmux.conf ... "
cp -r ./files/.tmux.conf "$DEST"
echo -e "\e[32mok\e[0m"

echo -n "→ Zed theme ... "
mkdir -p "$DEST"/.config/zed/themes
cp -r ./files/.config/zed/themes/darkside.json "$DEST"/.config/zed/themes
cp -r ./files/.config/zed/themes/seaside.json "$DEST"/.config/zed/themes
echo -e "\e[32mok\e[0m"

echo -n "→ Tilix theme ... "
mkdir -p "$DEST"/.config/tilix/schemes
cp -r ./files/.config/tilix/schemes/darkside.json "$DEST"/.config/tilix/schemes
cp -r ./files/.config/tilix/schemes/seashells.json "$DEST"/.config/tilix/schemes
echo -e "\e[32mok\e[0m"

echo -n "→ scripts ... "
cp -f ./files/scripts/alldone "$DEST/scripts/"
cp -f ./files/scripts/cheat "$DEST/scripts/"
cp -f ./files/scripts/cleardns "$DEST/scripts/"
cp -f ./files/scripts/git-logdate "$DEST/scripts/"
cp -f ./files/scripts/git-recent "$DEST/scripts/"
cp -f ./files/scripts/mcd "$DEST/scripts/"
cp -f ./files/scripts/pathadd "$DEST/scripts/"
cp -f ./files/scripts/tailtalk "$DEST/scripts/"
if [ ! -f "$DEST"/scripts/prompt-right-side ]; then
cp ./files/scripts/prompt-right-side "$DEST/scripts/"
fi
echo -e "\e[32mok\e[0m"

echo -n "→ bash ... "
cp -r ./files/bash "$DEST"
echo -e "\e[32mok\e[0m"

echo -n "→ cheatsheets ... "
cp -r ./files/cheatsheets "$DEST"
echo -e "\e[32mok\e[0m"

if [ ! -f "$DEST"/aliases.sh ]; then
    echo -n "→ aliases ... "
    cp ./files/aliases.sh "$DEST"/aliases.sh
    echo -e "\e[32mok\e[0m"
fi

echo -n "→ Updating Node to stable ... "
sudo npm install --silent --global n &> /dev/null && sudo n -q install stable &> /dev/null
echo -e "\e[32mok\e[0m"

./scripts/setup-php.sh
./scripts/setup-vscode.sh
./scripts/setup-git.sh

echo ''
echo 'All done! You will need to reboot for some changes to take effect.'
