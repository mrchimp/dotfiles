#!/usr/bin/env bash

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
        echo "→ Installing Homestead ..."
        git clone https://github.com/laravel/homestead.git ~/Homestead
        cd ~/Homestead || (echo 'Homestead directory does not exist.' && exit)
        git checkout release
        bash init.sh
        cd - || return
        echo -e "\e[32mok\e[0m"
    fi
fi
