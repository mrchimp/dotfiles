#!/usr/bin/env bash

read -p "Set up Git? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" ]]
then
    read -rp "Enter git email or leave blank to skip: " gitemail
    read -rp "Enter git name or leave blank to skip: " gitname

    echo -n "→ SSH Key ... "
    if [[ -f ~/.ssh/id_ed25519 ]]; then
        echo -e "\e[33mAlready exists.\e[0m"
    else
        echo -n "Generating new SSH key..."
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
fi
