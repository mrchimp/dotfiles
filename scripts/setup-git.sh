#!/usr/bin/env bash

read -p "Set up Git? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" ]]
then
    read -rp "Enter git email or leave blank to skip: " gitemail
    read -rp "Enter git name or leave blank to skip: " gitname

    git config --global column.ui auto
    git config --global branch.sort -committerdate    
    git config --global tag.sort version:refname
    git config --global init.defaultBranch main
    git config --global diff.algorithm histogram
    git config --global diff.colorMoved plain
    git config --global diff.mnemonicPrefix true
    git config --global diff.renames true
    git config --global push.autoSetupRemote true
    git config --global push.followTags true
    git config --global fetch.prune true
    git config --global fetch.pruneTags true
    git config --global fetch.all true
    git config --global help.autocorrect prompt
    git config --global commit.verbose true
    git config --global core.excludesfile ~/.gitignore
    git config --global merge.conflictstyle zdiff3
    git config --global pull.rebase true

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

    read -p "Set up Git SSH key? <y/N> " prompt
    if [[ $prompt == "y" || $prompt == "Y" ]]
    then
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
    fi
fi
