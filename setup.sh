
dest=${1:-~}

echo "Copying to $dest"

cp -rv ./files/* ./files/.* $dest

