
dest=${1:-~}

echo "Copying to $dest"
 
cp -rv ./files/.bash_prompt $dest
cp -rv ./files/.bashrc $dest
cp -rv ./files/_vimrc $dest
cp -rv ./files/.vim $dest
cp -rv ./files/.tmux.conf $dest

sudo apt-get install fortune cowsay

