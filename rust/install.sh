DEST=$HOME/.config/rust/bin

mkdir -p $DEST
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > $DEST/rust-analyzer
chmod +x $DEST/rust-analyzer


if [[ ":$PATH:" == *":$HOME/rust/bin:"* ]]; then
  echo "rust analyzer already in path"
else
  export PATH="$HOME/rust/bin:$PATH"
  echo "rust analyzer has been added to path"
fi

