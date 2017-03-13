
DEST=${1:-~}
VUNDLE=~/.vim/bundle/Vundle.vim

echo "Copying to $DEST"

echo "  → .ackrc"
cp -r ./files/.ackrc $DEST

echo "  → .bash_prompt"
cp -r ./files/.bash_prompt $DEST

echo "  → .bashrc"
cp -r ./files/.bashrc $DEST

echo "  → _vimrc"
cp -r ./files/_vimrc $DEST

echo "  → .vim"
cp -r ./files/.vim $DEST

echo "  → .tmux.conf"
cp -r ./files/.tmux.conf $DEST

echo "  → scripts"
cp -r ./files/scripts $DEST

echo "  → cheatsheets"
cp -r ./files/cheatsheets $DEST

echo "Adding ~/scripts/pathadd to \$PATH"
source ~/scripts/pathadd ~/scripts

echo "Installing bash-powerline - https://github.com/riobard/bash-powerline"
curl -s https://raw.githubusercontent.com/riobard/bash-powerline/master/bash-powerline.sh > ~/.bash-powerline.sh

echo "Installing Vundle - https://github.com/VundleVim/Vundle.vim"
if [ -d "$VUNDLE" ]; then
  cd "$VUNDLE"
  git pull origin master &> /dev/null
  cd - > /dev/null
else
  git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE" &> /dev/null
fi
echo -e "\033[33mTo install Vim plugins run :PluginInstall inside Vim\033[0m"

if type apt-get 2>/dev/null; then
  echo "Installing fortune and cowsay"
  sudo apt-get install fortune cowsay
else
  echo -e "\033[31mApt-get not installed, you'll need to manually install fortune and cowsay or accept that you'll have errors and no friendly bovine greetings.\033[0m"
fi

echo -e "\033[32mAll done!\033[0m"
