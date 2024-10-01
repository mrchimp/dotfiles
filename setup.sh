#!/usr/bin/env bash

DEST=${1:-~}

read -rp "Enter git email or leave blank to skip: " gitemail
read -rp "Enter git name or leave blank to skip: " gitname

echo -n "Making somewhere to store code ... "
mkdir -p ~/code
echo -e "\e[32mok\e[0m"

echo -n "Updating everything ... "
sudo apt-get -qq update
sudo apt-get -qq upgrade
echo -e "\e[32mok\e[0m"

echo "Installing software"
echo -n "→ git, tilix, zsh, htop, nodejs, npm, virtualbox, neovim, zsh, gh, ack, mdp, gnome-sushi, dconf-cli, uuid-runtime ... "
sudo apt-get -qq install git tilix zsh htop nodejs npm virtualbox neovim zsh gh ack mdp gnome-sushi dconf-cli uuid-runtime
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

echo -n "→ .bash_prompt ... "
cp -r ./files/.bash_prompt "$DEST"
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

echo -n "→ .zshrc ... "
cp -r ./files/.zshrc "$DEST"
echo -e "\e[32mok\e[0m"

echo -n "→ Zed theme ... "
mkdir -p "$DEST"/.config/zed/themes
cp -r ./files/.config/zed/themes/darkside.json "$DEST"/.config/zed/themes
echo -e "\e[32mok\e[0m"

echo -n "→ scripts ... "
cp -r ./files/scripts "$DEST"
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

read -p "Install PHP dev stuff? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" ]]
then
    echo -n "→ virtualbox ... "
    sudo apt-get -qq install virtualbox
    echo -e "\e[32mok\e[0m"

    echo -n "→ Vagrant ... "
    if command -v vagrant &> /dev/null; then
        echo -e "\e[33mAlready installed.\e[0m"
    else
        echo -n "→ Vagrant ... "
        if [[ -f /usr/share/keyrings/hashicorp-archive-keyring.gpg ]]; then
        echo -n "GPG key exists ... "
        else
        echo -n "Getting GPG key ... "
        wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
        fi

        echo -n "Adding repo ... "
        echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

        echo -n "Installing ... "
        sudo apt-get -qq update
        sudo apt-get -yqq install vagrant

        echo -e "\e[32mok\e[0m"
    fi


    echo -n "→ Homestead ... "
    if [[ -d ~/Homestead ]]; then
        echo -e "\e[33mAlready installed.\e[0m"
    else
        echo "→ Installing Homestead..."
        git clone https://github.com/laravel/homestead.git ~/Homestead
        cd ~/Homestead || (echo 'Homestead directory does not exist.' && exit)
        git checkout release
        bash init.sh
        cd - || return
        echo -e "\e[32mok\e[0m"
    fi
fi

echo -n "→ VS Code ... "
if command -v code &> /dev/null; then
    echo -e "\e[33mAlready installed.\e[0m"
else
    echo "installing ..."
    sudo apt install software-properties-common apt-transport-https wget -y
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt-get -qq install code
    echo -e "\e[32mok\e[0m"

    echo "→ Starting VS Code to configure sync..."
    (cd ~/code && code --sync on) &
    echo -e "\e[32mok\e[0m"
fi

echo -n "→ Updating Node ... "
sudo npm install --silent --global n &> /dev/null && sudo n -q install stable &> /dev/null
echo -e "\e[32mok\e[0m"

echo -n "→ Generating SSH Key ... "
if [[ -f ~/.ssh/id_ed25519 ]]; then
    echo -e "\e[33mAlready exists.\e[0m"
else
    echo -n "Generating new ssh key..."
    ssh-keygen -t ed25519 -C "chimpytk@gmail.com" -N "" -f ~/.ssh/id_ed25519 -q
    echo -e "\e[32mok\e[0m"
fi

echo -n "→ Logging in to Github CLI ... "
if gh auth status &> /dev/null; then
    echo -e "\e[33mAlready logged in.\e[0m"
else
    echo -n "Logging in to Github CLI..."
    gh auth login
    echo -e "\e[32mok\e[0m"
fi

echo -n "→ Setting Git identity ... "
if [  -z "$gitemail" ]; then
    echo -n "Skipping email ... "
else
    echo -n "$gitemail ... "
    git config --global user.email "$gitemail"
fi
if [  -z "$gitname" ]; then
    echo -n "Skipping name ... "
else
    echo -n "$gitname ..."
    git config --global user.name "$gitname"
fi
echo -e "\e[32mok\e[0m"

echo ''
echo 'All done! You will need to reboot for some changes to take effect.'
