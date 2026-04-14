#!/usr/bin/env bash

read -p "Apt stuff? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y"]]; then
  echo -n "Enabling universe repository ... " # Needed for fonts-firacode
  sudo add-apt-repository universe
  echo -e "\e[32mok\e[0m"

  echo -n "Updating everything ... "
  sudo apt-get -qq update
  sudo apt-get -qq upgrade
  echo -e "\e[32mok\e[0m"

  echo "Installing software"
  echo -n "→ git tilix zsh htop nodejs npm neovim gh ack mdp gnome-sushi dconf-cli uuid-runtime fonts-firacode bat fzf ... "
  sudo apt-get -qq install git tilix zsh htop nodejs npm neovim gh ack mdp gnome-sushi dconf-cli uuid-runtime fonts-firacode bat
  echo -e "\e[32mok\e[0m"
fi
