#!/usr/bin/env bash

read -p "Install VS Code? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" ]]
then
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
fi
