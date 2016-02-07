
DEST=${1:-~}
VUNDLE=~/.vim/bundle/Vundle.vim

echo "Copying to $DEST"

cp -rv ./files/.ackrc $DEST
cp -rv ./files/.bash_prompt $DEST
cp -rv ./files/.bashrc $DEST
cp -rv ./files/_vimrc $DEST
cp -rv ./files/.vim $DEST
cp -rv ./files/.tmux.conf $DEST
cp -rv ./files/scripts $DEST
cp -rv ./files/cheatsheets $DEST

source ~/scripts/pathadd ~/scripts

sudo apt-get install fortune cowsay

if [ -d "$VUNDLE" ]; then
  cd "$VUNDLE"
  git pull origin master
  cd -
else
  git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE"
fi

